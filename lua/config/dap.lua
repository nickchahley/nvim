-- local opts = { noremap = true, silent = true }
-- local keymap = vim.api.nvim_set_keymap
-- keymap('n', <KEYS>, <COMMAND>, opts)
-- dap keybindings
-- at least continue and set_breakpoint need to be global so they can start the debugger
vim.keymap.set('n', '<F5>', ":lua require'dap'.continue()<CR>")
vim.keymap.set('n', '<leader>dc', ":lua require'dap'.continue()<CR>")
vim.keymap.set('n', '<F6>', ":lua require'dap'.restart()<CR>")
vim.keymap.set('n', '<leader>dR', ":lua require'dap'.restart()<CR>")
vim.keymap.set('n', '<leader>dT', ":lua require'dap'.terminate()<CR>")
vim.keymap.set('n', '<F10>', ":lua require'dap'.step_over()<CR>")
vim.keymap.set('n', '<F11>', ":lua require'dap'.step_into()<CR>")
vim.keymap.set('n', '<F12>', ":lua require'dap'.step_out()<CR>")
vim.keymap.set('n', '<leader>db', ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set('n', '<leader>dB', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set('n', '<leader>lp', ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set('n', '<leader>dr', ":lua require'dap'.repl.open()<CR>")
vim.keymap.set('v', '<M-k>', ":lua require 'dapui').eval()<CR>")

-- toggle() and toggle(tray) are having identical effects
vim.keymap.set('n', '<leader>dui', ":lua require'dapui'.toggle()<CR>")
vim.keymap.set('n', '<leader>dut', ":lua require'dapui'.toggle('tray')<CR>")

-- global for debugging
dapui = require('dapui')
dapui.setup({
	layouts = {
	{
		elements = {
			-- elements can be strings or table with id and size keys.
			"scopes",
			"breakpoints",
		},
		size = 0.1,
		position = "left",
	},
	{
		elements = {
			"repl",
			"console",
		},
		size = 10,
		position = "bottom",
		},
	},
	mappings = {
		edit = 's',
		expand = { '<CR>', '<2-LeftMouse>'},
		open = 'h',
		repl = 'r',
		toggle = 't'
	},
})
-- No auto exit? I find it easier to just toggle dapui for all then times I want to see an
-- error message but then everything automatically shuts down
local dap  = require('dap')
dap.listeners.after.event_initialized['dapui_config'] = function()
	dapui.open()
end

-- dap-python
-- register the "adapter and configurations"
local dap_py = require('dap-python')
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
