-- just assume nix not windows
vim.env.VIMHOME = vim.env.HOME .. '/.config/nvim'
vim.env.SHADA = vim.env.HOME ..'/.local/share/nvim'
vim.env.BACKUNDOSWAP = vim.env.HOME .. '/.vim-backundoswap/'
vim.env.VH = vim.env.VIMHOME
vim.env.SH = vim.env.SHADA

-- HAVING TROUBLE WITH THIS I AM CONFUSED 
vim.keymap.set('n', '<leader>e', ":edit /home/nikoli/.config/nvim/lua/plugins<CR>")
