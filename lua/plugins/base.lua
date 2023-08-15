local M = { 
	{'tpope/vim-commentary', name = 'commentary', lazy = false, },
	{'wesQ3/vim-windowswap', name = 'windowswap', lazy = false, },
	{ 'tpope/vim-surround', name = 'surround', lazy = false, },
	{ 
		'ctrlpvim/ctrlp.vim', name = 'ctrlp', lazy = false,
		init = function()
			vim.g.ctrlp_map = '<c-t>'
		end,
	},
	{ 'godlygeek/tabular', lazy = false, },
	{ 'nickchahley/vim-manpager', name = 'manpager', lazy = false, },
	{ 'vim-scripts/BufOnly.vim', name = 'bufonly', lazy = false, },
	{ 'gioele/vim-autoswap', name = 'autoswap', lazy = false },
}

return M
