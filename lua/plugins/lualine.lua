-- lualine automatically chooses colors from theme (I think?) so I am not
-- really bothering w/ setting theme 
-- get number of open buffers. I would like to have this displayed in line
-- len(getbufinfo({'buflisted':1}))
local M = {
	{
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true },
		config = function()
			local nbuff = function() 
				-- #<var> is length operator
				n = #vim.fn.getbufinfo({buflisted = 1})
				return n
			end 
			require('lualine').setup ({
				sections = { 
					lualine_c = { 
						nbuff,
						'filename',
					} 
				}
			})
		end,
	},
}

return M
