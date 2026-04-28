local M = {}
local ls = require('luasnip')
local s = ls.s
local t = ls.text_node

function M.tab (n)
  n = n or 1
  local tabs = ""
  for j=1, n do tabs = tabs .. "\t" end
  return tabs
end
function M.newtab (n) return t({"", M.tab(n)}) end
function M.newline() return t({"",""}) end

return M
