return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false, -- Ensure the plugin is loaded immediately
        priority = 1000, -- Load this plugin before others
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato", -- Set the flavor to "mocha"
                transparent_background = false, -- Set to true if you want a transparent background
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    telescope = true,
                    treesitter = true,
                    -- Add other integrations as needed
                },
            })
            vim.cmd.colorscheme("catppuccin") -- Apply the colorscheme
        end,
    },
}
