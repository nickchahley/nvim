local M = {
	{ 'tpope/vim-sleuth', lazy = true },
	{ 'tpope/vim-fugitive' },
	{ 'tpope/vim-rhubarb' },
	{ 'sindrets/diffview.nvim', lazy = true,
		dependencies = {'nvim-tree/nvim-web-devicons',}
	},
	-- Adds git related signs to the gutter, as well as utilities for managing changes
  {
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
			require 'plugins.config.lspconfig'

			-- config of diagnostic and virtual text
			-- what I am after:
			--  use symbols in the gutter, maybe underlines, to identify diagnostic flags
			--  maybe be able to toggle virtual text
			--  I would like it if the gutter just stayed expanded the whole time so that my
			-- vim.diagnostic.config({ virtual_text = false })
			require('toggle_lsp_diagnostics').init({
				virtual_text = false
			})
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

	-- Fuzzy Finder (files, lsp, etc)
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- Fuzzy Finder Algorithm which requires local dependencies to be built.
			-- Only load if `make` is available. Make sure you have the system
			-- requirements installed.
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				-- NOTE: If you are having trouble with this installation,
				--       refer to the README for telescope-fzf-native for more instructions.
				build = 'make',
				cond = function()
					return vim.fn.executable 'make' == 1
				end,
			},
		},
		opts = {
			defaults = {
				mappings = {
					i = {
						['<C-u>'] = false,
						['<C-d>'] = false,
					},
				},
			},
		},
		config = function()
			-- Enable telescope fzf native, if installed
			pcall(require('telescope').load_extension, 'fzf')

			-- See `:help telescope.builtin`
			vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
			vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
			vim.keymap.set('n', '<leader>/', function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
					winblend = 10,
					previewer = false,
				})
			end, { desc = '[/] Fuzzily search in current buffer' })

			vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
			vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
			vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
			vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch cburrent [W]ord' })
			vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
			vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
			vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]resume' })
			vim.keymap.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find, { desc = '[S]earch [b]uffer' })
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
			require('nvim-treesitter.configs').setup {
				-- Add languages to be installed here that you want installed for treesitter
				ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'vimdoc', 'vim', 'r' },

				-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
				auto_install = false,

				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = '<c-space>',
						node_incremental = '<c-space>',
						scope_incremental = '<c-s>',
						node_decremental = '<M-space>',
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							['aa'] = '@parameter.outer',
							-- ['ia'] = '@parameter.inner',
							['af'] = '@function.outer',
							-- ['if'] = '@function.inner',
							['ac'] = '@class.outer',
							-- ['ic'] = '@class.inner',
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							[']m'] = '@function.outer',
							[']]'] = '@class.outer',
						},
						goto_next_end = {
							[']M'] = '@function.outer',
							[']['] = '@class.outer',
						},
						goto_previous_start = {
							['[m'] = '@function.outer',
							['[['] = '@class.outer',
						},
						goto_previous_end = {
							['[M'] = '@function.outer',
							['[]'] = '@class.outer',
						},
					},
					swap = {
						enable = true,
						swap_next = {
							['<leader>a'] = '@parameter.inner',
						},
						swap_previous = {
							['<leader>A'] = '@parameter.inner',
						},
					},
				},
			}

			-- Diagnostic keymaps
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
			vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
			vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


		end,
	},
}

return M
