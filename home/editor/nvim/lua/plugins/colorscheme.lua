return {
    -- add gruvbox
    { "catppuccin/nvim" },

    -- Configure LazyVim to load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin-nvim",
        },
    },
    {
        "catppuccin/nvim",
        opts = {
            float = {
                transparent = true,
            },
            transparent_background = true,
            flavour = "mocha",
        },
    },
}
