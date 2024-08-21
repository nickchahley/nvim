local time = require('utils.time')
local M = {
  {
    'RRethy/vim-hexokinase', name='hexokinase', lazy=false, build = 'make hexokinase',
    init = function()
      -- vim.g.Hexokinase_highlighters = { 'virtual', 'sign_column', 'background', 'backgroundfull', 'foreground', 'foregroundfull' }
      vim.g.Hexokinase_highlighters = {'virtual'}
      vim.g.Hexokinase_optInPatterns = {'full_hex,rgb,rgba,hsl,hsla'}
    end,
  },
  -- nvim-colorizer is maintained, but no virtual or signcoloumn opts
  -- {'norcalli/nvim-colorizer.lua', name='nvim-colorizer', lazy=false},
  {
    'neanias/everforest-nvim',
    name = 'everforest',
    version = false,
    lazy = false,
    priority = 1000, 
    -- TODO set color for listchars tab
    config = function()
      local bg = 'soft'
      if time.is_night() then bg = 'hard' end
      require("everforest").setup({
        background = bg,
      })
    end,
  },
  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    lazy = false,
    priority = 1000,
    opts = {style = 'moon'},
  },
  {
    'sainnhe/sonokai',
    lazy = true,
    init = function()
      vim.g.sonokai_style = 'default'
    end,
  },
  {
    'sainnhe/gruvbox-material',
    lazy = true,
    init = function()
      vim.g.gruvbox_material_background = 'soft'
      vim.g.gruvbox_material_foreground = 'material'
      vim.g.gruvbox_material_better_performance = 1
    end,
  },
  { 'rhysd/vim-color-spring-night', name = 'spring-night',
    lazy = true,
    priority = 1000,
    init = function()
      vim.g.spring_night_high_contrast = 0
      vim.cmd.colorscheme('spring-night')
    end,
  },
  { 'Mofiqul/dracula.nvim', name = 'dracula',
    lazy = true, init = function() vim.cmd.colorscheme('dracula') end
  },
  { 'catppuccin/nvim', name = "catppuccin", lazy = false, priority = 1000, },
  { 'shaunsingh/moonlight.nvim', name = 'moonlight', lazy=true, priority = 1000, },
  { 'rebelot/kanagawa.nvim', name = 'kanagawa', lazy = true, priority = 1000, },
  { 'karoliskoncevicius/sacredforest-vim', name = 'sacredforest', lazy=true, priority = 1000, },
  {
    'xero/miasma.nvim', name = 'miasma',
    lazy = true,
    branch = 'dev',
    dependencies = {
      "rktjmp/lush.nvim",
      "rktjmp/shipwright.nvim",
    },
    config = function()
      vim.cmd('colorscheme miasma')
    end,
  },
  { 'jacoborus/tender.vim', name = 'tender', lazy = true, },
  { 'fladson/vim-kitty' },
}

Everforest_bg = function(bg)
  local everforest = require('everforest')
  everforest.setup({background = bg})
  vim.cmd.colorscheme('everforest')
end
local Everforest_cycle_bg = function()
  local everforest = require('everforest')
  local cycle = {
    ['soft'] = 'medium',
    ['medium'] = 'hard',
    ['hard'] = 'soft'
  }
  local bg = everforest.config.background
  everforest.config.background = cycle[bg]
  vim.cmd.colorscheme('everforest')
end
vim.keymap.set('n', '<leader>ctb', Everforest_cycle_bg, { desc = '[C]ycle [T]heme [B]ackground' })

return M
