local M = {
	{
		'neanias/everforest-nvim',
		name = 'everforest',
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- TODO adjust cusorline hilight to be diff color from vscode bg (/soft
		-- bg)
		-- TODO set color for listchars tab
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
		lazy = true,
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
	{ 
		'rhysd/vim-color-spring-night', name = 'spring-night', priority = 1000,
		init = function()
			vim.g.spring_night_high_contrast = 0
		end,
	},
	{ 'Mofiqul/dracula.nvim', name = 'dracula', lazy = false, priority = 1000, },
	{ 'catppuccin/nvim', name = "catppuccin", priority = 1000, },
	{ 'shaunsingh/moonlight.nvim', name = 'moonlight', priority = 1000, },
	{ 'rebelot/kanagawa.nvim', name = 'kanagawa', lazy = true, priority = 1000, },
	{ 'karoliskoncevicius/sacredforest-vim', name = 'sacredforest', lazy=true, priority = 1000, },
	{ 
		'xero/miasma.nvim', name = 'miasma', 
		branch = 'dev',
		dependencies = {
			"rktjmp/lush.nvim",
			"rktjmp/shipwright.nvim",
		},
		lazy = true,
	},
	{ 'jacoborus/tender.vim', lazy = true, },
		

}

return M
