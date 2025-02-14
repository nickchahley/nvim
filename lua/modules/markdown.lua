local map = require('utils.keys').map

return {
  { "iamcco/markdown-preview.nvim", lazy=false,
    config = function()
      vim.fn["mkdp#util#install"]()
      require('config.markdown-preview')
      -- map('<leader>mp', '<Plug>MarkdownPreviewToggle')
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
