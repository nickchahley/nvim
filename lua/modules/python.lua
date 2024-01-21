local M = {
	{ 'nickchahley/pydoc.vim', lazy = false, },
	{ 'vim-scripts/indentpython.vim', lazy = true, },
	{ 'eddiebergman/nvim-treesitter-pyfold',
		config = function()
			require('nvim-treesitter.configs').setup {
				pyfold = {
					enable = true,
					-- Sets provided foldtext on window where module is active
					custom_foldtext = true
				}
			}
		end,
	}
}

return M
