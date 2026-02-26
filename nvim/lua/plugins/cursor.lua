return {
    {
        "karb94/neoscroll.nvim",
        opts = {},
    },
    {
        "sphamba/smear-cursor.nvim",
        opts = {
            cursor_color = "#b4befe", -- lavendar smear
            smear_between_buffers = true,
            smear_between_neighbor_lines = true,
            legacy_computing_symbols_support = false,
            stiffness = 0.65,
            trailing_stiffness = 0.45,
            stiffness_insert_mode = 0.7,
            trailing_stiffness_insert_mode = 0.7,
            damping = 0.75,
            damping_insert_mode = 0.85,
            distance_stop_animating = 0.5,
            time_interval = 10, -- reduce lag, milliseconds
        },
    },
}
