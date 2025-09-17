return {
    "saghen/blink.cmp",
    opts = {
        keymap = {
            preset = "none",
            ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<C-e>"] = { "hide", "fallback" },

            ["<Tab>"] = {
                function(cmp)
                    if cmp.snippet_active() then
                        return cmp.accept()
                    else
                        return cmp.select_and_accept()
                    end
                end,
                "snippet_forward",
                "fallback",
            },
            ["<S-Tab>"] = { "snippet_backward", "fallback" },

            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
            ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
            ["<C-n>"] = { "select_next", "fallback_to_mappings" },

            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },

            ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
    opts_extend = { "sources.default" },
}
--[[
return {
    "saghen/blink.nvim",
    build = "cargo build --release", -- for delimiters
    keys = {
        -- chartoggle
        {
            "<C-;>",
            function()
                require("blink.chartoggle").toggle_char_eol(";")
            end,
            mode = { "n", "v" },
            desc = "Toggle ; at eol",
        },
        {
            ",",
            function()
                require("blink.chartoggle").toggle_char_eol(",")
            end,
            mode = { "n", "v" },
            desc = "Toggle , at eol",
        },

        -- tree
        { "<C-e>", "<cmd>BlinkTree reveal<cr>", desc = "Reveal current file in tree" },
        { "<leader>E", "<cmd>BlinkTree toggle<cr>", desc = "Reveal current file in tree" },
        { "<leader>e", "<cmd>BlinkTree toggle-focus<cr>", desc = "Toggle file tree focus" },
    },
    -- all modules handle lazy loading internally
    lazy = false,
    opts = {
        chartoggle = { enabled = true },
        tree = { enabled = true },
    },
}

--]]
