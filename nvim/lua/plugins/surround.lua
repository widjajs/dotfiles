return {
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        lazy = false,
        init = function()
            vim.g.nvim_surround_no_mappings = true
            vim.g.nvim_surround_no_insert_mappings = true
        end,
        config = function()
            require("nvim-surround").setup({ highlight = { duration = 500 } })
            vim.keymap.set("n", "ys", "<Plug>(nvim-surround-normal)", { remap = true, desc = "Add surround" })
            vim.keymap.set("n", "yss", "<Plug>(nvim-surround-normal-cur)", { remap = true, desc = "Add surround line" })
            vim.keymap.set("v", "S", "<Plug>(nvim-surround-visual)", { remap = true, desc = "Add surround visual" })
            vim.keymap.set("v", "gs", "<Plug>(nvim-surround-visual)", { remap = true, desc = "Add surround gs" })
            vim.keymap.set("n", "ds", "<Plug>(nvim-surround-delete)", { remap = true, desc = "Delete surround" })
            vim.keymap.set("n", "cs", "<Plug>(nvim-surround-change)", { remap = true, desc = "Change surround" })
            vim.keymap.set(
                "i",
                "<C-g>s",
                "<Plug>(nvim-surround-insert)",
                { expr = true, remap = true, desc = "Add surround insert" }
            )
        end,
    },
}
