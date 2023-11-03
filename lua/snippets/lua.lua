local ls = require('luasnip')
local s = ls.s
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
local newline = t({"",""})
local newline_tab = t({"","\t"})
local S = {
	s({trig = "s[( ]", regTrig=true, dscr = "lua snippet"}, {
		t("s({ trig = \""), i(1, "trigger"), 
		t("\", dscr = \""), i(2, ""), t("\" }, {"), newline_tab,
		i(3, "t"), t("("), i(4, '{"",""}'), t(")"), newline,
		t({"}),"}),
	}),
	s({trig='sni[pfile]', regTrig=true}, {
		t({
			"local ls = require('luasnip')",
			"local s = ls.s",
			"local t = ls.text_node",
			"local i = ls.insert_node",
			'local newline = t({"",""})',
			"local S = {",
			"\ts('', {}),",
			"}",
			"return S",
		})
	}),
	s("map", {
		t("vim.keymap.set('"),
		i(1, "n"), t("', '"),
		i(2, "keys"), t("', '"),
		i(3, "command"), t("')")
	}),
	s("des", {
		t("{ desc = '"), i(1, ""), t("' }")
	}),
}
return S
