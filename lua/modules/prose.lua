local M = {
	{ 'junegunn/goyo.vim', name = 'goyo', lazy = false,
		init = function()
			vim.cmd.source(vim.env.VIMHOME .. '/lua/config/goyo.vim')
		end,
	},
	{ 'junegunn/limelight.vim', name = 'limelight', lazy = false,
		init = function()
			vim.keymap.set({ 'n', 'x' }, '<leader>L', '<Plug>(Limelight!!)', { silent = true })
		end,
	},
}
return M
