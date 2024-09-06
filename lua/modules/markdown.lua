return {
  { "iamcco/markdown-preview.nvim", lazy=true,
    config = function()
      vim.fn["mkdp#util#install"]()
      require('config.markdown-preview')
    end,
  },
  { "hedyhli/markdown-toc.nvim", lazy=true,
    ft = "markdown",  -- Lazy load on markdown filetype
    cmd = { "Mtoc" }, -- Or, lazy load on "Mtoc" command
    opts = {
      toc_list = {
        -- markers = {'*', '+', '-'},
        -- cycle_markers = true,
        indent_size = 4,
      }
    },
  },
}
