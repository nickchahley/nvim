local ts = require('telescope')
local tsb = require('telescope.builtin')
local lmap = require('utils.keys').leader_map

-- Enable telescope fzf native, if installed
pcall(ts.load_extension, 'fzf')

-- See `:help telescope.builtin`
lmap('?', tsb.oldfiles, { desc = '[?] Find recently opened files' })
lmap('<space>', tsb.buffers, { desc = '[ ] Find existing buffers' })
lmap('/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  tsb.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
lmap('sb', tsb.current_buffer_fuzzy_find, { desc = '[S]earch [b]uffer' })
lmap('gf', tsb.git_files, { desc = 'Search [G]it [F]iles' })
lmap('sf', tsb.find_files, { desc = '[S]earch [F]iles' })
lmap('sh', tsb.help_tags, { desc = '[S]earch [H]elp' })
lmap('sw', tsb.grep_string, { desc = '[S]earch cburrent [W]ord' })
lmap('sg', tsb.live_grep, { desc = '[S]earch by [G]rep' })
lmap('sd', tsb.diagnostics, { desc = '[S]earch [D]iagnostics' })
lmap('sr', tsb.resume, { desc = '[S]earch [R]resume' })
lmap('sm', tsb.keymaps, { desc = '[S]earch [M]maps' })
