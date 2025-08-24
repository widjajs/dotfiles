return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        opts = {
            flavour = "auto", -- or "latte", "frappe", "macchiato", "mocha"
            background = {
                light = "latte",
                dark = "macchiato",
            },
            transparent_background = false,
            integrations = {
                cmp = true,
                gitsigns = true,
                treesitter = true,
                telescope = true,
                mason = true,
                bufferline = true,
                -- add others you use
            },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
