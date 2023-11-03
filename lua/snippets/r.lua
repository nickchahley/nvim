local ls = require('luasnip')
local s = ls.s
local t = ls.text_node
local i = ls.insert_node
local newline = t({"",""})
--[[ ideas todo:
autos
	can use for >> to %>% 
	=T/=F >> =TRUE/=FALSE (readability)
	"^[\w]+ = " >> "<x> <- "

setup function w/ if blash supresstartupmessages
my typical conflicted prefers
]]
local S = {
	-- would like cleaner "this string or a partial match of this string",
	s({trig = "f[u]*[n]*[c]*", regTrig = true}, {
		t("function("), i(1, ""), t(") {"), newline,
		t("\t"), i(2, ""), newline,
		t("}")
	}),
	s({trig = "= f[u]*[n]*[c]*", regTrig = true}, {
		t("<- function("), i(1, ""), t(") {"), newline,
		t("\t"), i(2, ""), newline,
		t("}")
	}),
}
return S
