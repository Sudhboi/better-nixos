local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    s(
        { trig = "/**", snippetType = "autosnippet" },
        fmta(
            [[
    /**
        <>
    */
    ]],
            { i(0) }
        )
    ),
    s({ trig = "@p", snippetType = "autosnippet" }, t("@param ")),
    s({ trig = "@r", snippetType = "autosnippet" }, t("@return ")),
    s({ trig = "@t", snippetType = "autosnippet" }, t("@throws ")),
    s({ trig = "@a", snippetType = "autosnippet" }, t("@author Sudhir Krisna, 3796941")),
    s({ trig = "psvm", snippetType = "autosnippet" }, fmta("public static void main (String[] args) {<>}", { i(0) })),
    s({ trig = "sout", snippetType = "autosnippet" }, fmta("System.out.println(<>);", { i(0) })),
}
