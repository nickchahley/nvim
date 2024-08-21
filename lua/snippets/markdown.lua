local ls = require('luasnip')
local s = ls.s
local t = ls.text_node
local i = ls.insert_node
local newline = t({"",""})
local S = {
  --- codeblocks
  s("cb",{
    t("```"), i(1, ""),
    newline, i(2, "<verbose/code>"), t({ "", "```"}),
  }),
  s("sh",{
    t({"```bash", ""}), i(1, ""), t({ "", "```"}),
  }),
  s("yaml",{
    t({"```yaml", ""}), i(1, ""), t({ "", "```"}),
  }),
  s("py",{
    t({"```py", ""}), i(1, ""), t({ "", "```"}),
  }),
  s("r",{
    t({"```r", ""}), i(1, ""), t({ "", "```"}),
  }),
  s("con",{
    t({"```console", ""}), i(1, ""), t({ "", "```"}),
  }),
}
return S
