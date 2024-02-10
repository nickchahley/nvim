--[[ Non lsp-dependent python things
	Often on VMs I want to make some quick edits and node/npm is not setup (so no mason, so no lsps) and in those cases I usually just end up deleting the dev.lua module. 
--]]
local M = {
	{ 'nickchahley/pydoc.vim', lazy = false,
		config = function()
			vim.g.pydoc_window_lines = 0.4
		end,
	},
	{ 'vim-scripts/indentpython.vim', lazy = true, },
}

return M
