local M = {
	{
		'neanias/everforest-nvim',
		name = 'everforest',
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- TODO adjust cusorline hilight to be diff color from vscode bg (/soft
		-- bg)
		config = function()
			require("everforest").setup({
				background = 'soft',
			})
			-- require('lualine').setup {
			-- 	options = { theme = 'everforest' }
			-- }
		end,
	},
	{
		'folke/tokyonight.nvim',
		name = 'tokyonight',
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- require('lualine').setup {
			-- 	options = { theme = 'tokyonight' }
			-- }
		end,
	},
	{
		'sainnhe/sonokai',
		lazy = true,
		init = function()
			vim.g.sonokai_style = 'default'
		end,
	},
	{
		'sainnhe/gruvbox-material',
		lazy = false,
		init = function()
			vim.g.gruvbox_material_background = 'soft'
			vim.g.gruvbox_material_foreground = 'material'
			vim.g.gruvbox_material_better_performance = 1
		end,
		config = function()
			-- require('lualine').setup({
			-- 	options = { theme = 'gruvbox-material' }
			-- })
		end,
	},
	{ 'catppuccin/nvim', name = "catppuccin", priority = 1000, },
	{ 'rebelot/kanagawa.nvim', name = 'kanagawa', lazy = true, priority = 1000, },
	{ 'shaunsingh/moonlight.nvim', name = 'moonlight', priority = 1000, },
	{ 
		'rhysd/vim-color-spring-night', name = 'spring-night', priority = 1000,
		init = function()
			vim.g.spring_night_high_contrast = 0
		end,
	},
	{ 'karoliskoncevicius/sacredforest-vim', name = 'sacredforest', priority = 1000, },
	{ 'Mofiqul/dracula.nvim', name = 'dracula', lazy = false, priority = 1000, },
	{ 
		'xero/miasma.nvim', name = 'miasma', 
		branch = 'dev',
		dependencies = {
			"rktjmp/lush.nvim",
			"rktjmp/shipwright.nvim",
		},
		lazy = true,
	},
	{ 'xero/sourcerer.vim', name = 'sourcerer', lazy = true, priority = 1000, },
	{ 'jacoborus/tender.vim', lazy = true, },
		

}

return M
