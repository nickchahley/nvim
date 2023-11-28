local ls = require('luasnip')
local loaders = require('luasnip.loaders')
local snippets_path = vim.env.VIMHOME .. '/lua/snippets/'

ls.config.set_config {
	history = true,
	autosnippets = false,
	updateevents = "TextChanged,TextChangedI",
}

ls.setup({
	load_ft_func =
		-- Also load r snips when rmd file is opened
		require("luasnip.extras.filetype_functions").extend_load_ft({
			rmd = {'r'},
			lua = {'r'},
	})
})
local load_snippets = function ()
	require('luasnip.loaders.from_lua').load({paths = snippets_path})
end
load_snippets()
vim.keymap.set('n', '<Leader>rs', function() load_snippets() end,
	{desc = '[R]eload lua[S]nippets'})

-- expansion key. Fun fact: <c-k> is digraphs menu, overriding
vim.keymap.set({ 'i', 's' }, '<C-k>', function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

-- jump backwards key
vim.keymap.set({ 'i', 's' }, '<C-b>', function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

-- selecting within a list of options (choice nodes)
vim.keymap.set('i', '<C-l>', function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

vim.keymap.set("n", "<leader>es", loaders.edit_snippet_files)
