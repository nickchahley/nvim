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
local load_snippets = function()
  require('luasnip.loaders.from_lua').load({paths = snippets_path})
end
load_snippets()
vim.keymap.set('n', '<Leader>rs', function() load_snippets() end,
  {desc = '[R]eload lua[S]nippets'})
vim.keymap.set("n", "<leader>es", loaders.edit_snippet_files,
  {desc = '[E]dit lua[S]nippets'})

-- expansion key. Fun fact: <c-k> is digraphs menu, overriding
local expand_or_jump = function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end
vim.keymap.set({ 'i', 's' }, '<C-k>', expand_or_jump, { silent = true })

-- jump backwards key
local jump_backwards = function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end
vim.keymap.set({ 'i', 's' }, '<C-b>', jump_backwards, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-u>', jump_backwards, { silent = true,
  desc = 'jump [U]pwards/backwards' })

-- selecting within a list of options (choice nodes)
local change_choice = function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end
vim.keymap.set('i', '<C-l>', change_choice,
  {desc = 'cycle options [L]ist'})

