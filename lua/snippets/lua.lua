local ls = require('luasnip')
local s = ls.s
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
local newline = t({"",""})
local S = {
	s("des", {
		t("{ desc = '"), i(1, ""), t("' }")
	}),
	s("map", {
		t("vim.keymap.set('"),
		i(1, "n"), t("', '"),
		i(2, "keys"), t("', '"),
		i(3, "command"), t("')")
	}),
	s("s[( ]", {
		t("s("),
		t("\""), i(1, "trigger"), t({"\",{", "\t"}),
		i(2, "t"), t("("), i(3, '{"",""}'), t(")"),
		newline,
		t({"}),"}),
	}),
	s('sni[pfile]', {
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
	})
}
return S
