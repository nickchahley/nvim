-- just assume nix not windows
vim.env.VIMHOME      = vim.env.HOME .. '/.config/nvim'
vim.env.VH           = vim.env.VIMHOME -- alias
vim.env.VIMSHARE     = vim.env.HOME ..'/.local/share/nvim'
vim.env.BACKUNDOSWAP = vim.env.HOME .. '/.vim-backundoswap/'
vim.env.FUNCTIONS    = vim.env.VIMHOME .. '/functions'
