-- ~/.config/nvim/lua/plugins/conform.lua
return {
    {
        "stevearc/conform.nvim",
        opts = {
            -- Define formatters for specific file types
            formatters_by_ft = {
                lua = { "stylua" }, -- Use stylua for Lua files
                javascript = { "prettier" }, -- Use Prettier for JavaScript
                typescript = { "prettier" }, -- Use Prettier for TypeScript
                html = { "prettier" }, -- Use Prettier for HTML
                css = { "prettier" }, -- Use Prettier for CSS
                json = { "prettier" }, -- Use Prettier for JSON
                c = { "clang_format" }, -- Use clang-format for C files
                python = { "ruff" }, -- Use ruff for Python file
                java = { "clang_format" }, -- Use clang-format for Java files
                cpp = { "clang_format" }, -- Use clang-format for C++ files
                hpp = { "clang_format" }, -- Use clang-format for C++ header files
            },

            -- Customize formatter options
            formatters = {
                prettier = {
                    prepend_args = { "--tab-width=4", "--single-quote", "--print-width=80" }, -- Prettier options
                },
                stylua = {
                    prepend_args = { "--indent-width", "4" }, -- StyLua options
                },
                clang_format = {
                    prepend_args = {
                        "--style={BasedOnStyle: LLVM, ColumnLimit: 100, IndentWidth: 4, AllowShortFunctionsOnASingleLine: None, AccessModifierOffset: -4, IndentCaseLabels: true, IndentCaseBlocks: false }",
                    },
                },
            },
        },
    },
}
