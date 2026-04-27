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

local tex_utils = {}

tex_utils.in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

tex_utils.not_in_mathzone = function()
  return not tex_utils.in_mathzone()
end

tex_utils.in_env = function(name) -- generic environment detection
  local is_inside = vim.fn["vimtex#env#is_inside"](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end

tex_utils.in_tabular = function()
  return tex_utils.in_env("tabular")
end

tex_utils.not_in_tabular = function()
  return not tex_utils.in_tabular()
end

tex_utils.in_enumerate = function()
  return tex_utils.in_env("enumerate")
end

tex_utils.in_itemize = function()
  return tex_utils.in_env("itemize")
end

tex_utils.in_itemizeable = function()
  return tex_utils.in_enumerate() or tex_utils.in_itemize()
end

tex_utils.in_align = function()
  return tex_utils.in_env("align")
end

return {
  s({
    trig = "nk",
    wordTrig = false,
    snippetType = "autosnippet",
    condition = tex_utils.in_tabular,
  }, t("&")),

  s({
    trig = "ell",
    wordTrig = true,
    snippetType = "autosnippet",
  }, t("\\(\\ell\\)")),

  s(
    { trig = "nl", snippetType = "autosnippet", condition = tex_utils.in_tabular },
    fmta(
      [[
   \\
   <>
  ]],
      { i(0) }
    )
  ),

  s({
    trig = "it",
  }, t("\\item")),

  s({
    trig = "(.*)(^|\\s)([b-zB-Z])(\\s|,)",
    trigEngine = "ecma",
    snippetType = "autosnippet",
    condition = function()
      return (tex_utils.not_in_mathzone() and tex_utils.not_in_tabular())
    end,
  }, {
    f(function(_, snip)
      return (snip.captures[1] .. snip.captures[2] .. "\\(" .. snip.captures[3] .. "\\)" .. snip.captures[4])
    end),
  }),
}

--[[
  s({
    trig = "=",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = tex_utils.in_align,
  }, t("&=")),
]]
--
