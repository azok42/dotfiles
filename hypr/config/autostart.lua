hl.on("hyprland.start", function()
    hl.exec_cmd(apps.terminal)

    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")

    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("rfkill unblock bluetooth")
    hl.exec_cmd("clipcatd")
end)
