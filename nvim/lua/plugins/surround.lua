-- ~/.config/nvim/lua/custom/plugins.lua
return {
    {
        "kylechui/nvim-surround",
        version = "*",
        config = function()
            require("nvim-surround").setup({
                keymaps = {
                    insert = "<C-g>s",
                    visual = "gs",
                    normal = "ys",
                    normal_cur = "yss", -- current line
                    delete = "ds", -- delete surrounding
                    change = "cs", -- change surrounding
                },
            })
        end,
    },
}
