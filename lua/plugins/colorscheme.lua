--[[
local X = {
	{ 
		'sainnhe/everforest',
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_background = 'soft'
			vim.cmd.colorscheme('everforest')
		end,
	},

}
--]]

local M = {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins
	-- Optional; default configuration will be used if setup isn't called.
	config = function()
		require("everforest").setup({
			-- Your config here
			background = 'soft',
		})
		vim.cmd.colorscheme('everforest')
	end,
}

return M
