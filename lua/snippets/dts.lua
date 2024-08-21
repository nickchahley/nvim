local ls = require('luasnip')
local s = ls.s
local t = ls.text_node
local i = ls.insert_node

local tab = function(n)
  n = n or 1
  local tabs = ""
  for j=1, n do tabs = tabs .. "\t" end
  return tabs
end

local newline = t({"",""})
local newtab = function(n) return t({"", tab(n)}) end

local S = {
  s({ trig = "combo", regTrig = false, dscr = "zmk combo" },
    {
      t("ZMK_COMBO("),
      i(1, 'name'), t({", "}), i(2, 'bindings'), t({", "}), i(3, 'keypos'), t({", "}),
      i(4, "DEF NAV NUM"), t({", "}), i(5, 'COMBO_TERM_FAST, COMBO_IDLE_FAST'), t({")"}),
    }
  ),
  -- s({ trig = "bh", regTrig = false, dscr = "zmk behavior" },
  --   {
  --     t("ZMK_BEHAVIOR("),
  --     i(1, 'name'), t({", "}), i(2, 'compatable'), t({","}),
  --     newtab(1), t("bindings = "), i(3, '<bindings>'), t({";"}),
  --     newline, t({")"}),
  --   }
  -- ),
  s({ trig = "us", regTrig = false, dscr = "zmk mod-morph unshift" },
    {
      t('/omit-if-no-ref/ us_'), i(1,''), t(': unshift_'), i(2,''), t(' {'),
      newtab(1), t({'compatible = "zmk,behavior-mod-morph";'}),
      newtab(1), t({'#binding-cells = <0>;'}),
      newtab(1), t('bindings = <&kp '), i(3,''), t('>, <&kp '), i(4,''), t('>;'),
      newtab(1), t('mods = <(MOD_LSFT|MOD_RSFT)>;'),
      newline, t({'};'})
    }
  ),
}
return S
