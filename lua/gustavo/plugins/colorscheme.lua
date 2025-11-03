return {
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            variant = "moon",        -- or "dawn", "main"
            disable_background = true, -- Key for transparency
            disable_float_background = true, -- Also transparent floats
        },
    }
}
