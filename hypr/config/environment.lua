hl.env("XCURSOR_SIZE", "20")
hl.env("HYPRCURSOR_SIZE", "20")
hl.env("GTK_SCALE", "1")

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },

    debug = {
        disable_logs = false,
    },
})
