local M = {
	{'L3MON4D3/LuaSnip', name='luasnip', lazy=false,
		build = 'make install_jsregexp',
		config = function()
			require('config.luasnip')
		end,
	}
}

return M
