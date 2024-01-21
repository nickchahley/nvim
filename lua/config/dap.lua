local dap  = require('dap')
local dap_py = require('dap-python')
local k = vim.keymap
local lmap = require('utils.keys').leader_map
-- global for debugging
dapui = require('dapui')

vim.api.nvim_create_user_command(
  'DapClear',
  dap.clear_breakpoints,
  { desc = 'Clear all breakpoints' }
)

-- dap binds
lmap('dC', dap.run_to_cursor,  { desc = '[D]ap run to [C]ursor' })
lmap('de', dap.down, { desc = '[D]ap Down'} )
lmap('di', dap.up,   { desc = '[D]ap Up'} )
lmap('dS', dap.session,   { desc = '[D]ap [S]ession'} )
lmap('dg', dap.goto_, { desc = '[D]ap [G]o to line (no execute)'})
lmap('dc', dap.continue,  { desc = '[D]ap [C]ontinue' })
lmap('dR', dap.restart,   { desc = '[D]ap [R]estart' })
lmap('dL', dap.run_last,  { desc = '[D]ap run [L]ast' })
lmap('dT', dap.terminate, { desc = '[D]ap [T]erminate' })
lmap('dp', dap.pause,     { desc = '[D]ap [P]erminate' })
lmap('do', dap.step_over, { desc = '[D]ap step [O]ver'} )
lmap('dn', dap.step_into, { desc = '[D]ap step i[n]to'} )
lmap('dO', dap.step_out,  { desc = '[D]ap step [O]ut' } )
lmap('db', dap.toggle_breakpoint, { desc = '[D]ap toggle [B]reakpoint'})
lmap('dxb', dap.clear_breakpoints, { desc = '[D]ap [X]lear [B]reakpoints'})
lmap('dB', function()
		dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
	end, { desc = '[D]ap set [B]reakpoint condition' })
lmap('dl', function()
		dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
	end, { noremap = true, desc = '[D]ap toggle [L]ogpoint' })

-- new from dap help
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
	require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
	require('dap.ui.widgets').hover()
end)

-- Dap UI binds
lmap('dui', dapui.toggle, { desc = '[D]ap [UI] toggle' })
lmap('dut', [[:NvimTreeToggle<CR> :lua dapui.toggle()<CR>]], { desc = '[D]ap [U]I nvim[T]ree toggle' })
k.set('v', '<M-k>', ":lua require 'dapui').eval()<CR>")
lmap('dr', dap.repl.open, { desc = '[D]ap [R]epl open' })
lmap('dF',  dapui.float_element, { desc = '[D]apui [F]loat element' })
-- lmap('dfr', function() dapui.float_element('repl') end, { desc = '[D]apui [F]loat [R]epl' })
lmap("dw", function() require("dap.ui.widgets").hover() end, { desc = "Widgets" } )

dapui.setup({
	layouts = {
	{
		elements = {
			-- elements can be strings or table with id and size keys.
			{id = "scopes", size = 0.4},
			{id = "breakpoints", size=0.2},
			-- "stacks",
			-- "watches",
			{id = "console", size = 0.4},
		},
		size = 0.2,
		position = "left",
	},
	{ -- do not include console and outputs appear in repl!
		elements = {
			{id =  "repl", size=0.9},
		},
		size = 20,
		position = "bottom",
	},
	},
	mappings = {
		-- use a {table, to} apply multiple mappings
		edit = {'s', 'cc'},
		expand = { 'za', '<Tab>', '<CR>', '<2-LeftMouse>'},
		open = {'h'},
		remove = {'dd', 'x'},
		repl = 'r',
		toggle = 't'
	},
	floating = {
		border = 'single',
		mappings = {
			close = '<leader>dfc',
		},
	}
})
-- No auto exit? I find it easier to just toggle dapui for all then times I want to see an
-- error message but then everything automatically shuts down
dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end

-- dap-python
-- register the "adapter and configurations"
dap_py.setup('~/.virtualenvs/debugpy/bin/python', {
	console = 'integratedTerminal',
})

-- force python path "for now"
dap_py.resolve_python = function()
  return '~/.miniconda3/bin/python'
end

-- AIM: want to be able to run a single test in a file by toggling breakpoint

table.insert(require('dap').configurations.python, {
    name= "Pytest: Current File",
    type= "python",
    request= "launch",
    module= "pytest",
    args= {
        "${file}",
        "-sv",
        "--log-cli-level=INFO",
        "--log-file=test_out.log"
    },
    console= "integratedTerminal",
})


-- enable type checking for nvim-dap-ui to get type checking, documentation and autocompletion for all API functions.
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

-- FUTURE
-- require("nvim-dap-virtual-text").setup {commented = true,}
