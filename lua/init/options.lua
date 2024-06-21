-- nvim specific options (in case I remote into somewhere that can't install
-- nvim? this is a bit silly..) More likely this will just be where I
-- slowly add/move options until I can maybe get rid of init.vim

vim.cmd.colorscheme('everforest')
vim.opt.inccommand = 'nosplit' -- Incremental hilight for replace
vim.g.netrw_winsize = 20 -- ex for :Lexplore

-- vim.keymap.set('n', '<leader>id', 'r!date<CR>', {})
-- vim.cmd([[]])
