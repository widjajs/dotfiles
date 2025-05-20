return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "html" }, -- Add "html" to the list of parsers
            highlight = {
                enable = true, -- Enable syntax highlighting
            },
        },
    },
}
