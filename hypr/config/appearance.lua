hl.config({
    general = {
        gaps_in = 1,
        gaps_out = 6,

        border_size = 1,

        col = {
            active_border = {
                colors = {
                    "rgba(8EAEDBEE)",
                    "rgba(A8D2DEEE)",
                },
                angle = 45,
            },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 0,
        rounding_power = 2,

        active_opacity = 0.92,
        inactive_opacity = 0.84,

        shadow = {
            enabled = false,
        },

        blur = {
            enabled = true,
            size = 2,
            passes = 2,
            vibrancy = 0.1696,
        },
    },
})
