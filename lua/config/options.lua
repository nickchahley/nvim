-- settings that are nvim only, or I otherwise not wanted in remote vim config

vim.cmd.colorscheme('everforest')
vim.opt.inccommand = 'nosplit' -- incremental preview for replace
vim.opt.wildmode = {'longest', 'list', 'full'}
-- vim.cmd([[hi MatchParen gui=NONE cterm=NONE guibg=NONE  guifg=YELLOW ctermfg=YELLOW]])

