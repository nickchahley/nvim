local lmap = require('utils.keys').leader_map

local M = {
  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    opts = {
      defaults = {
        mappings = {
          i = { ['<C-u>'] = false, ['<C-d>'] = false, },
        },
      },
    },
    config = function()
      require('config.telescope')
    end,
  },
  -- LSP Configuration & Plugins
  { 'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      {'williamboman/mason-lspconfig.nvim'},

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- Additional lua configuration, "makes nvim stuff amazing!"
      { 
        'folke/neodev.nvim', opts = {}, enabled=false, -- disable for lazydev
        config = function()
          -- enable type checking for nvim-dap-ui to get type checking, documentation and autocompletion for all API functions.
          require("neodev").setup({
            library = { plugins = { "nvim-dap-ui" }, types = true },
          })
        end
      },

    },
    config = function()
      require 'config.lspconfig'
      vim.opt.signcolumn = 'yes'
      -- toggle all diagnostics on/off, formerly used https://github.com/WhoIsSethDaniel/toggle-lsp-diagnostics.nvim
      vim.keymap.set('n', '<leader>tld', function()
        vim.diagnostic.enable(not vim.diagnostic.is_enabled())
      end, { silent = true, noremap = true })
    end,
  },
  -- Highlight, edit, and navigate code
  { 'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'eddiebergman/nvim-treesitter-pyfold' ,
    },
    build = ':TSUpdate',
    config = function()
      require('config.treesitter')

      -- enable treesitter folding
      vim.cmd.foldmethod = 'expr'
      vim.cmd.foldexpr = 'nvim_treesitter#fold_expr()'
    end,
  },
  -- Highlight and quickfix todo comments
  { 'folke/todo-comments.nvim', lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('todo-comments').setup({
        -- this table could go in opts = {} if we were not also calling
        -- additional config lines after
        highlight = {
          keyword = 'fg', after = 'none',
          comments_only = false,
        },
      })
      -- :TodoTelescope :TodoLocList :TodoTrouble
      vim.keymap.set('n', ']t', function()
        require('todo-comments').jump_next()
      end, { desc = 'Next todo comment' })

      vim.keymap.set('n', '[t', function()
        require('todo-comments').jump_prev()
      end, { desc = 'Previous todo comment' })
    end,
  },
  {'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, opts = { }
  },
  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {}
  },
  -- Add indentation guides even on blank lines
  { 'lukas-reineke/indent-blankline.nvim',
    -- opts = {char = '┊', show_trailing_blankline_indent = false, },
    main = 'ibl',
    config = function()
      require('ibl').setup {
        indent = {char = '┊' }
      }
    end,
  },
  -- Debug Adapters
  { 'mfussenegger/nvim-dap',
    dependencies = {
      {-- auto install debug adapters
        'jay-babu/mason-nvim-dap.nvim',
        config = function()
          -- sets up dap in "the" predefined manner
          require('mason-nvim-dap').setup({ handlers = {} })
        end
      },
      {'Weissle/persistent-breakpoints.nvim',
        config = function()
          require('persistent-breakpoints').setup{
            load_breakpoints_event = { "BufReadPost" }
          }
        end
      },
      'nvim-treesitter/nvim-treesitter' ,
      'theHamsta/nvim-dap-virtual-text',
      'nvim-neotest/nvim-nio',
      'rcarriga/nvim-dap-ui',
      'mfussenegger/nvim-dap-python',
      'jbyuki/one-small-step-for-vimkind',
    },
    config = function() require('config.dap') end,
  },

  -- TRYING new neotest stuff
  { -- Took from github insallation, put the optionals into it as dependencies
    -- ensure that neodev is disabled/uninstalled
    "folke/lazydev.nvim",
    -- enabled = false,
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
    dependencies = {
      { -- optional cmp completion source for require statements and module annotations
        "hrsh7th/nvim-cmp",
        enabled = false,
        opts = function(_, opts)
          opts.sources = opts.sources or {}
          table.insert(opts.sources, {
            name = "lazydev",
            group_index = 0, -- set group index to 0 to skip loading LuaLS completions
          })
        end,
      },
      { -- optional blink completion source for require statements and module annotations
        "saghen/blink.cmp",
        enabled = false,
        opts = {
          sources = {
            -- add lazydev to your completion providers
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
              lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                -- make lazydev completions top priority (see `:h blink.cmp`)
                score_offset = 100,
              },
            },
          },
        },
      }
    }
  },
  { -- getting started with neotest bc I want to do something like 'launch test and attach/open debugger if a test fails'. Saw a comment somewhere from person who had this
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python"
    },
    config = function()
      local neotest = require('neotest')
      neotest.setup({
        adapters = {
          require("neotest-python")
        },
        dap = {
          justMyCode = false,
        },
        runner = 'pytest',
        python = '~/.miniconda3/bin/python',
      })
      local run = function()
        neotest.run.run()
      end
      lmap('td', function()
          neotest.run.run({strategy = 'dap'})
        end, { desc = '[t]est [d]ebug'})
      lmap('tr', run, { desc = '[t]est [run]'})
    end,
  },

  -- Git
  { 'tpope/vim-fugitive', lazy = false,
    config = function()
      -- Undocumented interface for supporting alternative layouts explained
      -- https://github.com/tpope/vim-fugitive/issues/1080#issuecomment-521100430
      --
      -- Things I want to implement/understand better:
      -- diff b/t current file and index:
      -- :Gdiff :0
      -- current file and rev
      -- :Gdiff [revision]
      -- current file and 3 commits ago
      -- :Gdiff ~3
      vim.cmd([[
        " Take o map and make it available on l
        let g:nremap = {'o': 'l', 'O': 'L', 'i': 'j', 'I': 'J'}
        let g:xremap = g:nremap
        let g:oremap = g:nremap
      ]])
      lmap('gs', ':Git<cr>')
    end
  },
  { 'tpope/vim-rhubarb', lazy = false,
    config = function()
      lmap('gg', ':GBrowse<cr>')
      lmap('gb', ':Git blame<cr>')
    end
  },
  { 'sindrets/diffview.nvim', lazy = false,
    -- :h diff-mode 
    -- :DiffviewOpen :DiffviewOpen HEAD~2
    -- :DiffviewToggleFiles
    -- :DiffviewFileHistory
    dependencies = {'nvim-tree/nvim-web-devicons',}
  },
  -- gitsigns (gutter)
  {-- Adds git related signs to the gutter and utilities for managing changes
    'lewis6991/gitsigns.nvim', lazy = true,
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      -- why is this part of opts? Could I put this into config = function
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({'n', 'v'}, ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, {expr=true, buffer = bufnr, desc = "Jump to next hunk"})
        vim.keymap.set({'n', 'v'}, '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, {expr=true, buffer = bufnr, desc = "Jump to previous hunk"})
      end,
    },
  },
}

return M
