-- let g:vimwiki_list = [{'path': '~/path/', 'bullet_types' = ['-', '•', '→']}]

local function wiki_table(path)
  -- path must include leading `/` ex /vimwiki
  local syntaxes = {
    vim = 'vim', lua = 'lua',
    python = 'python', py = 'python', r = 'r', go = 'go', cpp = 'cpp',
    bash = 'bash', zsh = 'zsh', fish = 'fish',
    config = 'config', i3 = 'i3config', sway = 'i3config',
    md = 'markdown', markdown = 'markdown', rmd = 'rmd', tex = 'tex',
    css = 'css', html = 'html', js = 'javascript',
    yaml = 'yaml', toml = 'toml'
  }
  local default_wiki = {
    ext = '.wiki',
    diary_rel_path = '', -- Keep diary entries flat in the root dir
    auto_diary_index = 1,
    links_space_char = '-', -- my link >> my-link.wiki
    bullet_types = {'-', '*', '+'},
    nested_syntaxes = syntaxes,
  }
  default_wiki['path'] = path
  default_wiki['path_html'] = path .. '/site_html/'
  return default_wiki
end

local M = {
  {
    'vimwiki/vimwiki', lazy=false,
    init = function()
      vim.cmd([[nmap <Leader>w<Space> <Plug>VimwikiIndex]])

      -- Lead w/ WIKI to group in tab completion
      vim.env.WIKISIMMUNOME = vim.env.HOME .. '/simmunome-wiki'
      vim.env.WIKIPERSONAL = vim.env.HOME .. '/vimwiki'

      -- Allow customs beyond default wiki
      local simmunome_wiki = wiki_table(vim.env.WIKISIMMUNOME)
      local personal_wiki = wiki_table(vim.env.WIKIPERSONAL)

      vim.g.vimwiki_list = {
        simmunome_wiki,
        personal_wiki
      }

      vim.g.vimwiki_hl_headers = 1       -- Color header levels
      vim.g.vimwiki_hl_cb_checked = 2    -- Hilighting for checked list items
      vim.g.vimwiki_table_mappings = 0   -- don't take over tab in insert mode
      vim.g.vimwiki_folding = 'syntax'
      vim.g.vimwiki_toc_header_level = 4

      -- Should this (mapping at least) be put inside of after/ftplugin/vimwiki.vim? Does that make things faster or slower?
      -- Find incomplete tasks is super powerful actually, and I should use it more often.
      vim.cmd([[ 
        " Open a QuickFix window with incomplete tasks that are in a hyphenated list
        function! VimwikiFindIncompleteTasks()
        lvimgrep /- \[ \]/ %:p
        lopen
        endfunction

        function! VimwikiFindAllIncompleteTasks()
        VimwikiSearch /- \[ \]/
        lopen
        endfunction

        nmap <Leader>wa :call VimwikiFindAllIncompleteTasks()<CR>
        nmap <Leader>wx :call VimwikiFindIncompleteTasks()<CR>
      ]])

      -- Here I try to disable annoying things clobbering my maps
      -- if these are still being bound, try putting in after/ftplugin
      vim.cmd([[
        vmap <F13> @<Plug>VimwikiTextObjListSingleV
        vmap <F13> @<Plug>VimwikiTextObjColumnInnerV
        vmap <F13> @<Plug>VimwikiTextObjTableCellInnerV
        vmap <F13> @<Plug>VimwikiTextObjHeaderSubContentV
        vmap <F13> @<Plug>VimwikiTextObjHeaderContentV
        vmap <F13> @<Plug>VimwikiTextObjHeaderV
        vmap <F13> @<Plug>VimwikiTextObjHeaderSubV
        vmap <F13> @<Plug>VimwikiTextObjTableCellV
        vmap <F13> @<Plug>VimwikiTextObjColumnV
        vmap <F13> @<Plug>VimwikiTextObjListChildrenV
        vmap <F13> <Plug>VimwikiTextObjListSingleV
        vmap <F13> <Plug>VimwikiTextObjColumnInnerV
        vmap <F13> <Plug>VimwikiTextObjTableCellInnerV
        vmap <F13> <Plug>VimwikiTextObjHeaderSubContentV
        vmap <F13> <Plug>VimwikiTextObjHeaderContentV
        vmap <F13> <Plug>VimwikiTextObjHeaderV
        vmap <F13> <Plug>VimwikiTextObjHeaderSubV
        vmap <F13> <Plug>VimwikiTextObjTableCellV
        vmap <F13> <Plug>VimwikiTextObjColumnV
        vmap <F13> <Plug>VimwikiTextObjListChildrenV
      ]])
    end,
  },
}

return M
