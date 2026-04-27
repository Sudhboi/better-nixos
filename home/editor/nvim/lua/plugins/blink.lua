return {
  {
    "saghen/blink.cmp",
    opts = {
      enabled = function()
        return vim.tbl_contains({ "tex", "lean", "lua", "typst", "nix", "python" }, vim.bo.filetype)
      end,
    },
  },
}
