return {
    {
        "vimpostor/vim-tpipeline",
        config = function()
            if vim.env.TMUX then
                -- Basic configuration for vim-tpipeline
                vim.g.tpipeline_autoembed = 1 -- Automatically embed the status line in tmux
                vim.g.tpipeline_restore = 1
                vim.g.tpipeline_size = 150 -- Set the size of the status line
                vim.g.tpipeline_fill = " " -- Fill character for the status line
            end
        end,
    },
}
