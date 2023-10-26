local M = {
	{ 'junegunn/goyo.vim', name = 'goyo', lazy = false,
		init = function()
			vim.cmd.source(vim.env.VIMHOME .. '/lua/config/goyo.vim')
		end,
	},
}
return M
