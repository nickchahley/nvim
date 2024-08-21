
-- Load local functions (bite sized plugins)
vim.cmd([[source $FUNCTIONS/ToggleStatusline.vim]])

-- Return to previous line when reopeing a file
vim.cmd([[
  augroup line_return
    au!
    au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   execute 'normal! g`"zvzz' |
      \ endif
  augroup END
]])
