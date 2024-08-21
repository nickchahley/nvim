local ls = require('luasnip')
local s = ls.s
local t = ls.text_node
local i = ls.insert_node
local newline = t({"",""})
local newline_tab = t({"","\t"})

local S = {
  s({ trig = "func", dscr = "" }, {
    t("function! "), newline_tab, 
    i(""), newline,
    t("endfunction"),
  }),
}
return S
