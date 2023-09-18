local M = {
	{ 'nickchahley/pydoc.vim', lazy = true, },
	{ 'vim-scripts/indentpython.vim', lazy = true, },
	-- Please let pyright lsp use my correct conda env
	{
		'linux-cultist/venv-selector.nvim', lazy = false,
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-telescope/telescope.nvim",
			"mfussenegger/nvim-dap-python"
		},
		opts = {
			-- path = '/home/nikoli/.minicona3',
			anaconda_base_path = '/home/nikoli/.miniconda3',
			anaconda_envs_path = 'home/nikoli/.miniconda3/envs',
		},
		keys = {{
			'<leader>vs', '<cmd>:VenvSelect<cr>',
			-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
			'<leader>vc', '<cmd>:VenvSelectCached<cr>'
		}}
	},
}

return M
