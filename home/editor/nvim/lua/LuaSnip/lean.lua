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
  { "RR", "ℝ" },
}

local interactiveSnippets = {
  { "\\<", "⟨<>⟩", { i(1) } },
}

local snippets = {}

for _, pair in ipairs(basicSnippets) do
  table.insert(snippets, basicSnippet(pair[1], pair[2], (#pair >= 3 and pair[3] or 1000)))
end

for _, pair in ipairs(interactiveSnippets) do
  table.insert(snippets, interactiveSnippet(pair[1], pair[2], pair[3], (#pair >= 4 and pair[4] or 1000)))
end

return snippets
