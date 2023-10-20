local M = {
	{ 'junegunn/goyo.vim', name = 'goyo', lazy = false,
		init = function()
			vim.cmd.source('/home/nikoli/.config/nvim/lua/plugins/config/goyo.vim')
		end,
	},
}
return M
