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
    s({ trig = "dm", snippetType = "autosnippet" }, fmta("\\[ <> \\]", { i(1) })),
    s({ trig = "mk", snippetType = "autosnippet" }, fmta("\\(<>\\)", { i(1) })),
    s(
        { trig = "\\be", snippetType = "autosnippet", condition = line_begin },
        fmta(
            [[
    \begin{<>}<>
        <>
    \end{<>}
    ]],
            { i(1), i(2), i(0), rep(1) }
        )
    ),
    s(
        { trig = "make_table", condition = line_begin },
        fmta(
            [[
    \begin{center}
    \begin{tabular}{<>}
        <>
    \end{tabular}
    \end{center}
    ]],
            { i(1, "c|c"), i(2) }
        )
    ),
    s(
        { trig = "make_codeblock", condition = line_begin },
        fmta(
            [[
    \begin{tcolorbox}[enhanced,attach boxed title to top center={yshift=-3mm,yshifttext=-1mm},
		colback=white,colframe=catppuccin-blue-mocha,colbacktitle=white,
		title=<>,fonttitle=\ttfamily\Large,coltitle=catppuccin-text-latte,breakable,pad at break*=3mm,
		boxed title style={size=small,colframe=catppuccin-blue-mocha, boxrule=1pt} ]
    \begin{minted}[breaklines]{<>}
        <>
    \end{minted}
    \end{tcolorbox}
    ]],
            { i(2), i(1), i(0) }
        )
    ),
}
