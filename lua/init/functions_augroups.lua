
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

vim.cmd[[
  function! Idsort()
    " '<,'>call Idsort()
    " sort lines, preserving indented groups. Does not sort the indented groups
    " only works for indent level 1
    silent '<,'>s/\v\n\t(\S.*)/\\x02\1/
    '<,'>sort i
    silent '<,'>s/\\x02/\r\t/g
  endfunction
]]
