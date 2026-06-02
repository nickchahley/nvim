-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  local map = function(keys, func, desc, mode)
    mode = mode or 'n'
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
  end

  map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  map('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  map('<leader>k', vim.lsp.buf.hover, 'Hover Documentation')
  map('<leader>K', vim.lsp.buf.signature_help, 'Signature Documentation')


  -- Execute a code action, usually your cursor needs to be on top of an error
  -- or a suggestion from your LSP for this to activate.
  map('ga', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

  map('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  map('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  map('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })


  -- create a keymap to toggle inlay hints in your code, if the language server you are using supports them
  --
  -- This may be unwanted, since they displace some of your code
  if client and client:supports_method('textDocument/inlayHint', event.buf) then
    map('<leader>th', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }) end, '[T]oggle Inlay [H]ints')
  end

end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  pyright = {
    settings = {
      python = {
        disableLanguageServices = true,
        diagnostics = { globals = {'config'} },
      },
    }
  },
  r_language_server = {
    cmd = { "R", "--slave", "-e", "languageserver::run()" },
    filetypes = { "r", "rmd", "Rmd" },
    log_level = 2
  },
  vimls = {},
  cssmodules_ls = {},
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
        diagnostics = {
          globals = {
            'vim',
            'require',
          },
        },
      },
    },
  }
}

for k, v in pairs(servers) do
  vim.lsp.config(k, v)
end

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

require('mason').setup()
mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
  vim.lsp.config(server, {
      on_attach = on_attach,
  })
  vim.lsp.enable(server)
end

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
