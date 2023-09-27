-- dap keybindings, global so they can start the debugger
vim.keymap.set('n', '<F5>', ":lua require'dap'.continue()<CR>")
vim.keymap.set('n', '<leader>dc', ":lua require'dap'.continue()<CR>")
vim.keymap.set('n', '<F6>', ":lua require'dap'.restart()<CR>")
vim.keymap.set('n', '<leader>dR', ":lua require'dap'.restart()<CR>")
vim.keymap.set('n', '<F10>', ":lua require'dap'.step_over()<CR>")
vim.keymap.set('n', '<F11>', ":lua require'dap'.step_into()<CR>")
vim.keymap.set('n', '<F12>', ":lua require'dap'.step_out()<CR>")
vim.keymap.set('n', '<leader>db', ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set('n', '<leader>dB', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set('n', '<leader>lp', ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set('n', '<leader>dr', ":lua require'dap'.repl.open()<CR>")
vim.keymap.set('n', '<leader>dui', ":lua require'dapui'.toggle()<CR>")


-- dap-python
-- register the "adapter and configurations"
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python', {
	console = 'integratedTerminal',
})

-- force python path "for now"
require('dap-python').resolve_python = function()
  return '/usr/bin/python3'
end

require('dapui').setup({
	{ -- user_config
		mappings = {
			edit = 's',
			expand = { '<CR>', '<2-LeftMouse>'},
			open = 'h',
			repl = 'r',
			toggle = 't'
		},
	}
})
-- local opts = { noremap = true, silent = true }
-- local keymap = vim.api.nvim_set_keymap
-- keymap('n', <KEYS>, <COMMAND>, opts)

-- enable type checking for nvim-dap-ui to get type checking, documentation and autocompletion for all API functions.
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})
