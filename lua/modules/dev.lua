local M = {
	-- Fuzzy Finder (files, lsp, etc)
	{ 'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim',
				-- Fuzzy Finder Algorithm which requires local dependencies to be built.
			  -- Only load if `make` is available. Make sure you have the system
			  -- requirements installed.
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
			{ 'folke/neodev.nvim', opts = {} },

			{'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
				config = function()
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
				end,
			},
		},
		config = function()
			require 'config.lspconfig'
			vim.opt.signcolumn = 'yes'
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
					keyword = 'fg', after = 'fg',
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
		},
		config = function() require('config.dap') end,
	},
	-- Please let pyright lsp use my correct conda env (haven't needed lately)
	{ 'linux-cultist/venv-selector.nvim', lazy = true,
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-telescope/telescope.nvim",
			"mfussenegger/nvim-dap-python"
		},
		opts = {
			path = '/home/nikoli/.miniconda3',
			-- anaconda_base_path = '/home/nikoli/.miniconda3',
			-- anaconda_envs_path = 'home/nikoli/.miniconda3/envs',
		},
		keys = {{
			'<leader>vs', '<cmd>:VenvSelect<cr>',
			'<leader>vc', '<cmd>:VenvSelectCached<cr>'
		}},
	},
--[[
	-- git things
	-- Don't think I've every actually used a git-related plugin other than diff
	-- view, and am suspicious that it could be slowing things down in large repos
	{ 'tpope/vim-sleuth', lazy = true },
	{ 'tpope/vim-fugitive', lazy = true },
	{ 'tpope/vim-rhubarb', lazy = true },
	{ 'sindrets/diffview.nvim', lazy = true,
		dependencies = {'nvim-tree/nvim-web-devicons',}
	},
]]
--[[
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
	]]

}

return M
