hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "auto",
    scale = 1.2,
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "preferred",
    position = "auto",
    scale = 1.2,
    mirror = "eDP-1",
})
