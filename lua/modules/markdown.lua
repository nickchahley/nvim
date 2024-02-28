return {
	{ "iamcco/markdown-preview.nvim",
    config = function()
      vim.fn["mkdp#util#install"]()
			require('config.markdown-preview')
    end,
	},
}
