local M = {
    terminal = "foot",
    fastfetch_terminal = "foot -eH fastfetch --config archey.jsonc",
    file_manager = "lf",
    browser = "librewolf",

    menu = "rofi -show drun",
    root_browser = "rofi -show recursivebrowser",
    file_browser = "rofi -show recursivebrowser",

    discord = "vesktop --ozone-platform-hint=auto",
    lock = "hyprlock",
}

_G.apps = M
