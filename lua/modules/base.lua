local map = require('utils.keys').map

local M = {
  {'wesQ3/vim-windowswap', name = 'windowswap', lazy = false, },
  {'kylechui/nvim-surround', lazy = false,
    config = function()
      require("nvim-surround").setup({})
      require('config.surround')
    end,
  },
  { 'tpope/vim-repeat', name = 'repeat', lazy = false },
  { 'tpope/vim-eunuch',  name = 'eunuch', lazy = false },
  { 'tpope/vim-unimpaired',  name = 'unimpaired', lazy = true },
  { 'tpope/vim-speeddating',  name = 'speeddating', lazy = true },
  { 'godlygeek/tabular', lazy = false,
    --[[ 
      TODO: patterns
        only one comma
        only one =
        only one <x>
        last " (ex vim comments)
    --]]
    config = function()
      vim.cmd([[
        AddTabularPattern comma /,\zs/l0l1
        AddTabularPattern first_comma /^[^,]*\zs,/r0c0l0
      ]])

      local function tabmap(keys, cmd, desc, opts)
        local tab_leader = '<leader>t'
        return map(tab_leader .. keys, cmd, desc, opts, 'v')
      end

      tabmap('=', ':Tab /=<cr>', 'Tab =' )
      tabmap('.', ':Tab /:<cr>', 'Tab :')
      tabmap(',', ':Tab comma<cr>', 'Tab comma')
    end,
  },
  { 'nickchahley/vim-manpager', name = 'manpager', lazy = false, },
  { 'vim-scripts/BufOnly.vim', name = 'bufonly', lazy = false, },
  { 'gioele/vim-autoswap', name = 'autoswap', lazy = false },
  { 'christoomey/vim-titlecase', name = 'titlecase', lazy = false },
  { 'triglav/vim-visual-increment', name = 'visual-increment', lazy = false },
  { 'mbbill/undotree', lazy = false,
    config = function()
      vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)
      vim.api.nvim_exec2([[
        function g:Undotree_CustomMap()
          nmap <buffer> I <plug>UndotreeNextState
          nmap <buffer> E <plug>UndotreePreviousState
        endfunc
      ]], {})
    end,
  },
  { 'numToStr/Comment.nvim', opts = { basic = true, } },
  { 'mileszs/ack.vim', name = 'ack'}, -- combine w/ :cdo for project-wide
  { 'stevearc/oil.nvim', name = 'oil',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require('config.oil') end,
  },
  { 'chase/vim-ansible-yaml' },
  { 'Fymyte/rasi.vim' },
  { 'lambdalisue/suda.vim', },
  { 'AndrewRadev/splitjoin.vim' },
  { 'nickchahley/colemak-vim', name = 'colemak', lazy = false },
}

return M
