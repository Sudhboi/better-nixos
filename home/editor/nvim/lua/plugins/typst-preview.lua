return {
    {
        'chomosuke/typst-preview.nvim',
        lazy = false, -- or ft = 'typst'
        version = '1.*',
        opts = {},    -- lazy.nvim will implicitly calls `setup {}`
    },
    -- {
    --     "pxwg/math-conceal.nvim",
    --     event = "VeryLazy",
    --     main = "math-conceal",
    --     --- @type LaTeXConcealOptions
    --     opts = {
    --         conceal = {
    --             "greek",
    --             "script",
    --             "math",
    --             "font",
    --             "delim",
    --             "phy",
    --         },
    --         ft = { "plaintex", "tex", "context", "bibtex", "markdown", "typst" },
    --     },
    -- }
}
