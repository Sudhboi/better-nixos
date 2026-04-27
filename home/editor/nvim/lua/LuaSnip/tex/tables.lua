local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node

return {
  s("mntable", {
    t("%Column Layout: "),
    i(1, "|c|c|"),
    t({ "", "%Row Layout: " }),
    i(2, "|r|r|"),
    t({ "", "" }),
    d(3, function(args)
      print("a")
      local column_layout = args[1][1]
      local row_layout = args[2][1]
      local nodes = {}
      local index = 1
      table.insert(nodes, t({ "\\begin{center}", "\\begin{tabular}{" .. column_layout .. "}", "" }))
      for char in row_layout:gmatch(".") do
        if char == "|" then
          table.insert(nodes, t({ "\\hline", "" }))
        else
          local first_of_row = true
          for sub_char in column_layout:gmatch(".") do
            if sub_char ~= "|" then
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
          end
          table.insert(nodes, t({ "\\\\", "" }))
        end
      end
      table.insert(nodes, t({ "\\end{tabular}", "\\end{center}" }))
      return sn(nil, nodes)
    end, { 1, 2 }),
  }),
}
