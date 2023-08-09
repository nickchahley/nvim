local M = {
	{
		'L3MON4D3/LuaSnip',
		-- follow latest release.
		version = '2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = 'make install_jsregexp',
		lazy = true,

		config = function()
			require('luasnip').setup({
				
				-- <filetype>.lua
				require('luasnip.loaders.from_lua').load({paths = '~/.config/nvim/lua/snippets/'}),
				-- allow snipmate-like snippets (<filetype>.snippets)
				require('luasnip.loaders.from_snipmate').lazy_load({paths = '~/.config/nvim/lua/snippets/'}),

				ls.config.set_config({
					history = true, -- keep around last snippet local to jump back
					enable_autosnippets = true,
				}),
			})
			-- this is the keymap config (as an alt to vimscript) w/ the vimscript tab maps
			vim.keymap.set({'i'}, '<Tab>', function() ls.expand() end, {silent = true})
			vim.keymap.set({'i', 's'}, '<Tab>', function() ls.jump( 1) end, {silent = true})
			vim.keymap.set({'i', 's'}, '<S-Tab>', function() ls.jump(-1) end, {silent = true})

			vim.keymap.set({'i', 's'}, '<C-E>', function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, {silent = true})
		end, -- config end
	},
}


return M
