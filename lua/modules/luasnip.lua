local M = {
	{'L3MON4D3/LuaSnip', name='luasnip', lazy=false,
		build = 'make install_jsregexp',
		config = function()
			require('config.luasnip')
		end,
	}
	-- I'm not ready yet for autocompletion. Want to square off treesitter and lsp
	-- documentation first. Putting AC here, since it has luasnip dependency and
	-- both are "expand snipped" things
	-- Autocompletion 
	--[[ {
		'hrsh7th/nvim-cmp',
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',

			-- Adds LSP completion capabilities
			'hrsh7th/cmp-nvim-lsp',

			-- Adds a number of user-friendly snippets
			'rafamadriz/friendly-snippets',
			},
	}, ]]
}

return M
