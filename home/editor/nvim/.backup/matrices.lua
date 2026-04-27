local ls = require("luasnip")
local s = ls.snippet
local c = ls.choice_node
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node

local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {
  s({ trig = "matrix-builder", snippetType = "autosnippet", wordtrig = false, condition = in_mathzone }, {
    t("%column number: "),
    i(1, "2"),
    t({ "", "%row number: " }),
    i(2, "2"),
    t({ "", "" }),
    d(3, function(args)
      print("a")
      local columns = args[1][1]
      local rows = args[2][1]
      local nodes = {}
      local index = 2
      table.insert(nodes, t({ "\\left[", "\\begin{array}{" }))
      table.insert(
        nodes,
        c(1, {
          t(string.rep("c", columns)),
          t(string.rep("c", columns - 1) .. "|c"),
        })
      )
      table.insert(nodes, t({ "}", "" }))
      for _ = 1, rows do
        local first_of_row = true
        for _ = 1, columns do
          if first_of_row then
            table.insert(nodes, i(index))
            index = index + 1
            first_of_row = false
          else
            table.insert(nodes, t("&"))
            table.insert(nodes, i(index))
            index = index + 1
          end
        end
        table.insert(nodes, t({ "\\\\", "" }))
      end
      table.insert(nodes, t({ "\\end{array}", "\\right]" }))
      return sn(nil, nodes)
    end, { 1, 2 }),
  }),
  s({ trig = "(a)?mat(\\d+)x(\\d+)", trigEngine = "ecma", condition = in_mathzone }, {
    d(1, function(_, snip)
      print("a")
      local aug = snip.captures[1] == "a"
      local columns = snip.captures[3]
      local rows = snip.captures[2]
      local nodes = {}
      local index = 1
      table.insert(nodes, t({ "\\left[\\begin{array}{" }))
      if aug then
        table.insert(nodes, t(string.rep("c", columns - 1) .. "|c"))
      else
        table.insert(nodes, t(string.rep("c", columns)))
      end
      table.insert(nodes, t({ "}", "" }))
      for _ = 1, rows do
        local first_of_row = true
        for _ = 1, columns do
          if first_of_row then
            table.insert(nodes, i(index))
            index = index + 1
            first_of_row = false
          else
            table.insert(nodes, t(" & "))
            table.insert(nodes, i(index))
            index = index + 1
          end
        end
        table.insert(nodes, t({ "\\\\", "" }))
      end
      table.insert(nodes, t({ "\\end{array}\\right]", "" }))
      return sn(nil, nodes)
    end),
  }),
}
