-- lualine automatically chooses colors from theme (I think?) so I am not
-- really bothering w/ setting theme 
--[[
-- default configuration
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
--]]
local M = {
	{
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true },
		config = function()
			local nbuff = function() 
				-- #<var> is length operator
				local n = #vim.fn.getbufinfo({buflisted = 1})
				n = tostring(n) .. 'b'
				return n
			end 
			local nline = function()
				local n = vim.api.nvim_buf_line_count(0)
				return n .. 'L'
			end
			local nbuff_nline = function()
				return nbuff() .. ' ' .. nline()
			end
			require('lualine').setup ({
				sections = { 
					lualine_c = {'filename',},
					lualine_x = {'encoding', 'fileformat', 'filetype', nbuff},
					lualine_y = {nline,},
				}
			})
		end,
	},
}

return M
