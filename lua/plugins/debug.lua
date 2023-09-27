local M = {
	{ 'mfussenegger/nvim-dap',
		dependencies = {
			-- 'jay-babu/mason-nvim-dap.nvim',
			'mfussenegger/nvim-dap-python',
			'rcarriga/nvim-dap-ui',
			'Weissle/persistent-breakpoints.nvim',
		},
		config = function()
			require 'plugins.config.dap'
		end,
	},
	-- Please let pyright lsp use my correct conda env
	{
		'linux-cultist/venv-selector.nvim', lazy = true,
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
		}},
	},
}

return M
