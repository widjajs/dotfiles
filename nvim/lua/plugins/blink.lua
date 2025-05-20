return {
    "saghen/blink.cmp",
    opts = {
        keymap = { preset = "super-tab" },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
    opts_extend = { "sources.default" },
}
