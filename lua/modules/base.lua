local M = {
	{'wesQ3/vim-windowswap', name = 'windowswap', lazy = false, },
	{ 'tpope/vim-surround', name = 'surround', lazy = false, },
	{ 'tpope/vim-repeat', name = 'repeat', lazy = false },
	{ 'tpope/vim-eunuch',  name = 'eunuch', lazy = false },
	{ 'tpope/vim-unimpaired',  name = 'unimpaired', lazy = true },
	{ 'tpope/vim-speeddating',  name = 'speeddating', lazy = true },
	{ 'godlygeek/tabular', lazy = false,
		config = function()
			vim.api.nvim_exec2([[				
				AddTabularPattern comma /,\zs/l0l1
				AddTabularPattern first_comma /^[^,]*\zs,/r0c0l0
			]], {})
		end,
	},
	{ 'nickchahley/vim-manpager', name = 'manpager', lazy = false, },
	{ 'vim-scripts/BufOnly.vim', name = 'bufonly', lazy = false, },
	{ 'gioele/vim-autoswap', name = 'autoswap', lazy = false },
	{ 'christoomey/vim-titlecase', name = 'titlecase', lazy = false },
	{ 'triglav/vim-visual-increment', name = 'visual-increment', lazy = false },
	{ 'mbbill/undotree', lazy = false,
		config = function()
			vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)
			vim.api.nvim_exec2([[
				function g:Undotree_CustomMap()
					nmap <buffer> I <plug>UndotreeNextState
					nmap <buffer> E <plug>UndotreePreviousState
				endfunc
			]], {})
		end,
	},
	{ 'numToStr/Comment.nvim', opts = { basic = true, } },
	{ 'stevearc/oil.nvim',
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function() require('config.oil') end,
	},
	{ 'mileszs/ack.vim'}, -- combine w/ :cdo for project-wide replacements?
	{ 'chase/vim-ansible-yaml' },
	{ 'Fymyte/rasi.vim' },
	{ '/lambdalisue/suda.vim', },
	{ 'nickchahley/colemak-vim', name = 'colemak', lazy = false },
}

return M
