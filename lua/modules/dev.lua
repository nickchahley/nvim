local M = {
	{ 'tpope/vim-sleuth', lazy = true },
	{ 'tpope/vim-fugitive' },
	{ 'tpope/vim-rhubarb' },
	{ 'sindrets/diffview.nvim', lazy = true,
		dependencies = {'nvim-tree/nvim-web-devicons',}
	},
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

	-- LSP Configuration & Plugins
	{ 'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			{ 'folke/neodev.nvim', opts = {} },

			'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
		},
		config = function()
			require 'config.lspconfig'

			require('toggle_lsp_diagnostics').init({ virtual_text = false })
			vim.keymap.set('n', "<leader>tlv", "<Plug>(toggle-lsp-diag-vtext)")
			-- "Toggle Lsp diagnostics
			-- "No" = off, "Yes" = on
			vim.cmd([[
				nmap <leader>tlu <Plug>(toggle-lsp-diag-underline)
				nmap <leader>tlp <Plug>(toggle-lsp-diag-update_in_insert)
				nmap <leader>tld  <Plug>(toggle-lsp-diag)
				nmap <leader>tln <Plug>(toggle-lsp-diag-off)
				nmap <leader>tly <Plug>(toggle-lsp-diag-on)
			]])
			vim.opt.signcolumn = 'yes'
		end,
	},
	-- Autocompletion
	--[[ {
		'hrsh7th/nvim-cmp',
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',

			-- Adds LSP completion capabilities
			'hrsh7th/cmp-nvim-lsp',

			-- Adds a number of user-friendly snippets
			'rafamadriz/friendly-snippets',
			},
	}, ]]

	-- Useful plugin to show you pending keybinds.
	{ 'folke/which-key.nvim', opts = {} },

	-- Add indentation guides even on blank lines
	{
		'lukas-reineke/indent-blankline.nvim',
		-- opts = {char = '┊', show_trailing_blankline_indent = false, },
		main = 'ibl',
		config = function()
			require('ibl').setup {
				indent = {char = '┊' }
			}
		end,
	},
	-- nvim-mapper looks rad, but requires wrapping all keymap definitions ..
	-- { "gregorias/nvim-mapper",
 --  dependencies = "nvim-telescope/telescope.nvim",
 --  config = function()
	-- 	require("nvim-mapper").setup({
	-- 			-- do not assign the default keymap (<leader>MM)
	-- 			no_map = false,
	-- 			-- Available actions:
	-- 			--   * "definition" - Go to keybind definition (default)
	-- 			--   * "execute" - Execute the keybind command
	-- 			action_on_enter = "definition",
	-- 	})
	-- end,
	-- },
	{ -- Fuzzy Finder (files, lsp, etc)
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ -- Fuzzy Finder Algorithm which requires local dependencies to be built.
			  -- Only load if `make` is available. Make sure you have the system
			  -- requirements installed.
				'nvim-telescope/telescope-fzf-native.nvim',
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
	-- Highlight, edit, and navigate code
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ':TSUpdate',
		config = function()
			require('config.treesitter')
			-- Diagnostic keymaps
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
			vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
			vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
		end,
	},
	-- Debug Adapters
	{ 'mfussenegger/nvim-dap',
		dependencies = {
			-- 'jay-babu/mason-nvim-dap.nvim',
			'rcarriga/nvim-dap-ui',
			'Weissle/persistent-breakpoints.nvim',
			'nvim-treesitter/nvim-treesitter' ,
			'theHamsta/nvim-dap-virtual-text',
			'mfussenegger/nvim-dap-python',
		},
		config = function() require('config.dap') end,
	},
	-- Please let pyright lsp use my correct conda env
	{
		'linux-cultist/venv-selector.nvim', lazy = true,
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-telescope/telescope.nvim",
			"mfussenegger/nvim-dap-python"
		},
		opts = {
			-- path = '/home/nikoli/.minicona3',
			-- anaconda_base_path = '/home/nikoli/.miniconda3',
			-- anaconda_envs_path = 'home/nikoli/.miniconda3/envs',
		},
		keys = {{
			'<leader>vs', '<cmd>:VenvSelect<cr>',
			'<leader>vc', '<cmd>:VenvSelectCached<cr>'
		}},
	},
}

return M
