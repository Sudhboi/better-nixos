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

local in_mathzone = function()
    return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local basicSnippet = function(trigText, repText, priorityNum)
    return s(
        { trig = trigText, snippetType = "autosnippet", wordTrig = false, condition = in_mathzone, priority = priorityNum },
        t(repText)
    )
end

local interactiveSnippet = function(trigText, repForm, subs, priorityNum)
    return s(
        { trig = trigText, snippetType = "autosnippet", wordTrig = false, condition = in_mathzone, priority = priorityNum },
        fmta(repForm, subs)
    )
end

local basicSnippets = {

    -- Greek Letters
    { "@a",     "\\alpha" },
    { "@b",     "\\beta" },
    { "@g",     "\\gamma" },
    { "@G",     "\\Gamma" },
    { "@d",     "\\delta" },
    { "@D",     "\\Delta" },
    { "@e",     "\\epsilon" },
    { ":e",     "\\varepsilon" },
    { "@z",     "\\zeta" },
    { "@t",     "\\theta" },
    { "@T",     "\\Theta" },
    { ":t",     "\\vartheta" },
    { "@i",     "\\iota" },
    { "@k",     "\\kappa" },
    { "@l",     "\\lambda" },
    { "@L",     "\\Lambda" },
    { "@s",     "\\sigma" },
    { "@S",     "\\Sigma" },
    { "@u",     "\\upsilon" },
    { "@U",     "\\Upsilon" },
    { "@o",     "\\omega" },
    { "@O",     "\\Omega" },
    { "mu",     "\\mu" },

    -- Logic
    { "lnot",   "\\lnot" },
    { "land",   "\\land" },
    { "lor",    "\\lor" },
    { "->",     "\\to" },
    { "<->",    "\\leftrightarrow", 1001 },
    { "!>",     "\\mapsto" },
    { "=>",     "\\implies" },
    { "=<",     "\\impliedby" },
    { "forall", "\\forall" },
    { "exists", "\\exists" },

    -- Basic Operations
    { "sr",     "^{2}" },
    { "cb",     "^{3}" },
    { "invs",   "^{-1}" },
    { "mod",    "\\text{ mod }" },

    { "conj",   "^{*}" },
    { "Re",     "\\mathrm{Re}" },
    { "Im",     "\\mathrm{Im}" },

    -- Linear Algebra
    { "trace",  "\\mathrm{Tr}" },

    -- More Operations
    { "cdot",   "\\cdot" },

    -- Equality
    { "===",    "\\equiv" },
    { "!=",     "\\neq" },
    { ">=",     "\\geq" },
    { "<=",     "\\leq" },
    { "<<",     "\\ll" },
    { ">>",     "\\gg" },
    { "simm",   "\\sim" },
    { "sim=",   "\\simeq" },
    { "prop",   "\\propto" },

    -- Set Operations
    { "inter",  "\\cap" },
    { "union",  "\\cup" },
    { "inn",    "\\in" },
    { "notin",  "\\not\\in" },
    { "eset",   "\\emptyset",       1001 },

    -- Geometry
    { "ang",    "\\angle " },
    { "ell",    "\\ell" },
    { "prp",    "\\perp" },
    { "deg",    "\\degree" },
}

local interactiveSnippets = {

    -- Text Environment
    { "text", "\\text{<>}",               { i(1) } },
    { '""',   "\\text{<>}",               { i(1) } },

    -- Basic Operations
    { "rd",   "^{<>}",                    { i(1) } },
    { "_",    "_{<>}",                    { i(1) } },
    { "sq",   "\\sqrt{ <> }",             { i(1) } },
    { "//",   "\\frac{<>}{<>}",           { i(1), i(2) } },
    { "ee",   "e^{ <> }",                 { i(1) } },

    { "bf",   "\\mathbf{<>}",             { i(1) } },
    { "rm",   "\\mathrm{<>}",             { i(1) } },
    { "bb",   "\\mathbb{<>}",             { i(1) } },

    -- Set Operations
    { "set",  "\\{ <> \\}",               { i(1) } },

    -- Geometry
    { "ol",   "\\overline{<>}",           { i(1) } },
    { "o->",  "\\overrightarrow{<>}",     { i(1) },      1001 },
    { "o<->", "\\overleftrightarrow{<>}", { i(1) },      1002 },
}

local snippets = {}

for _, pair in ipairs(basicSnippets) do
    table.insert(snippets, basicSnippet(pair[1], pair[2], (#pair >= 3 and pair[3] or 1000)))
end

for _, pair in ipairs(interactiveSnippets) do
    table.insert(snippets, interactiveSnippet(pair[1], pair[2], pair[3], (#pair >= 4 and pair[4] or 1000)))
end

return snippets
