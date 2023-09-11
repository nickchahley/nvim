local M = { 
	{'tpope/vim-commentary', name = 'commentary', lazy = false, },
	{'wesQ3/vim-windowswap', name = 'windowswap', lazy = false, },
	{ 'tpope/vim-surround', name = 'surround', lazy = false, },
	{ 'tpope/vim-eunuch',  name = 'eunuch', lazy = false },
	{ 
		'ctrlpvim/ctrlp.vim', name = 'ctrlp', lazy = false,
		init = function()
			-- same map used for fzf or rg in terminal
			vim.g.ctrlp_map = '<c-t>'
		end,
	},
	{ 'godlygeek/tabular', lazy = false, },
	{ 'nickchahley/vim-manpager', name = 'manpager', lazy = false, },
	{ 'vim-scripts/BufOnly.vim', name = 'bufonly', lazy = false, },
	{ 'gioele/vim-autoswap', name = 'autoswap', lazy = false },
	{ 'christoomey/vim-titlecase', name = 'titlecase', lazy = false },
	{ 'triglav/vim-visual-increment', name = 'visual-increment', lazy = false },
	{ 'nickchahley/colemak-vim', name = 'colemak', lazy = false },
}

return M
