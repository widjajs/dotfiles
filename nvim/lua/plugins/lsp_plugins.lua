-- Version for mason.nvim and mason-lspconfig.nvim
local mason_version = "^2.0.0"

return {
    -- Mason-lspconfig: Bridge between Mason and lspconfig
    {
        "mason-org/mason-lspconfig.nvim",
        version = mason_version,
        dependencies = {
            "mason-org/mason.nvim",
            -- lspconfig: LSP configurator
            "neovim/nvim-lspconfig",
        },
    },

    -- Refactoring library: code extraction, extract variable, debugging
    {
        "ThePrimeagen/refactoring.nvim",
        lazy = true,
        cmd = "Refactor",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            -- Prompt for return type
            prompt_func_return_type = {
                go = true,
                cpp = true,
                c = true,
                java = true,
            },
            -- Prompt for function parameters
            prompt_func_param_type = {
                go = true,
                cpp = true,
                c = true,
                java = true,
            },
            print_var_statements = {
                -- Change C printf-based statement to use jump marker to easily fill in format specifier
                c = {
                    'fprintf(stderr, "%s %%<++>", %s);',
                },
            },
        },
    },

    -- nvim-lsp-endhints: Display inlay hints at the end of the line
    {
        "chrisgrieser/nvim-lsp-endhints",
        event = "LspAttach",
        opts = {},
    },

    -- lsp_signature: Better function signature display
    {
        "ray-x/lsp_signature.nvim",
        lazy = true,
        opts = {
            bind = true,
            handler_opts = {
                border = "rounded",
            },
        },
    },
}
