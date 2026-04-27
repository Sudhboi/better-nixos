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
        { trig = "make_document" },
        fmta(
            [[
  \documentclass{<>}
  \usepackage[margin=1in]{geometry}
  \usepackage{graphicx, float}
  \usepackage[shortlabels]{enumitem}
  \usepackage{amsmath, amsthm, amssymb}
  \usepackage[Conny]{fncychap}
  \title{<>}
  \author{Sudhir Krisna Kesavamoorthy Nanthakumar<>}
  \date{<> 2026}

  \begin{document}

  \maketitle

  <>

  \end{document}
  ]],
            { i(1), i(2), i(3), i(4), i(0) }
        )
    ),

    s({ trig = "assign" }, fmta("<> Assignment <>", { i(1), i(0) })),

    s(
        { trig = "make_image" },
        fmta(
            [[
\begin{figure}[H]
    \centering
    \includegraphics[width=<>\linewidth]{<>}
    \caption{<>}
    \label{fig:<>}
\end{figure}
]],
            { i(2, "0.75"), i(1), i(3, "Enter Caption Here"), i(4, "placeholder") }
        )
    ),
    s(
        { trig = "add_colors_catppuccin" },
        fmta(
            [[
\usepackage{xcolor}
\definecolor{catppuccin-base-mocha}{RGB}{30, 30, 46}
\definecolor{catppuccin-blue-mocha}{RGB}{137, 180, 250}
\definecolor{catppuccin-green-mocha}{RGB}{166, 227, 161}
\definecolor{catppuccin-red-latte}{RGB}{210, 15, 57}
\definecolor{catppuccin-base-latte}{RGB}{239, 241, 245}
\definecolor{catppuccin-base-frappe}{RGB}{48, 52, 70}
\definecolor{catppuccin-text-latte}{RGB}{76, 79, 105}
\definecolor{catppuccin-text-mocha}{RGB}{205, 214, 244}
<>
    ]],
            { i(0) }
        )
    ),
    s(
        { trig = "import_minted" },
        fmta(
            [[
\usepackage{minted2}
\renewcommand\MintedPygmentize{/home/sudhirk/LaTypst/LaTeX/.direnv/python-3.13/bin/pygmentize}
\usemintedstyle{catppuccin-mocha}
<>
    ]], { i(0) }
        )
    ),
}
