local dap  = require('dap')
local dap_py = require('dap-python')
local lmap = require('utils.keys').leader_map
local desc = function(string)
	return {desc = '[d]ap ' .. string}
end
-- global for debugging
dapui = require('dapui')

vim.api.nvim_create_user_command(
  'DapClear',
  dap.clear_breakpoints,
  { desc = 'Clear all breakpoints' }
)

-- dap binds
vim.keymap.set('n', '<leader>dc', ":lua require'dap'.continue()<CR>")
vim.keymap.set('n', '<leader>dR', ":lua require'dap'.restart()<CR>")
vim.keymap.set('n', '<leader>dT', ":lua require'dap'.terminate()<CR>")
lmap('dsov', dap.step_over, { desc = '[D]ap [S]tep [OV]er'} )
lmap('dsi',  dap.step_into, { desc = '[D]ap [S]tep [I]nto'} )
lmap('dsou', dap.step_out,  { desc = '[D]ap [S]tep [O]ut' } )
lmap('db', dap.toggle_breakpoint, { desc = '[D]ap toggle [B]reakpoint'})
vim.keymap.set('n', '<leader>dB', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set('n', '<leader>dr', ":lua require'dap'.repl.open()<CR>")
lmap('dlm', function()
	dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end, { noremap = true, desc = '[d]ap [l]og point [m]essage' })

-- dapui binds
vim.keymap.set('v', '<M-k>', ":lua require 'dapui').eval()<CR>")
vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })
vim.keymap.set('n', '<leader>dui', dapui.toggle)
vim.keymap.set('n', '<leader>df', dapui.float_element, { desc = '[D]apui [F]loat element' })
vim.keymap.set('n', '<leader>dfr', function() dapui.float_element('repl') end, { desc = '[D]apui [F]loat [R]epl' })

dapui.setup({
	layouts = {
	{
		elements = {
			-- elements can be strings or table with id and size keys.
			"scopes",
			"breakpoints",
			"console",
		},
		size = 0.1,
		position = "left",
	},
	{ -- do not include console and outputs appear in repl!
		elements = {{id =  "repl", size=0.9}}, size = 10, position = "bottom",
	},
	},
	mappings = {
		-- use a table to apply multiple mappings
		edit = {'s', 'cc'},
		expand = { 'za', '<Tab>', '<CR>', '<2-LeftMouse>'},
		open = 'h',
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
dap.listeners.after.event_initialized['dapui_config'] = function() 
	dapui.open()
end

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
