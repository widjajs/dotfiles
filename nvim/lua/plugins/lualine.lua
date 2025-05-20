return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional: for icons
        config = function()
            require("lualine").setup({
                sections = {
                    lualine_a = { "mode" }, -- Mode (Normal, Insert, Visual, etc.)
                    lualine_b = { "branch" }, -- Git branch
                    lualine_c = { "filename" }, -- File name
                    lualine_x = { "filetype" }, -- File type
                    lualine_y = { "progress" }, -- Progress (line number/total lines)
                    lualine_z = { "location" }, -- Location (line:column)
                },
            })
            -- Disable native statusline only inside tmux
            if vim.env.TMUX then
                vim.opt.laststatus = 0
                vim.schedule(function()
                    vim.opt.laststatus = 0
                end)
            end
        end,
    },
}
