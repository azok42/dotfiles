local bind = require("lib.bind")

local main = "SUPER"

bind.exec(main .. " + Q", apps.terminal, "Open terminal")
bind.exec(main .. " + N", apps.fastfetch_terminal, "Open fastfetch terminal")
bind.exec(main .. " + E", apps.file_manager, "Open file manager")
bind.exec(main .. " + B", apps.browser, "Open browser")
bind.exec(main .. " + D", apps.discord, "Open Vesktop")
bind.exec(main .. " + F", "pkill rofi || " .. apps.file_browser, "Open file browser")
bind.exec(main .. " + W", "pkill waybar || waybar", "Toggle Waybar")
bind.exec(main .. " + T", "swaync-client -t", "Toggle notifications")
bind.exec(main .. " + SHIFT + V", "clipcat-menu", "Open clipboard menu")
bind.exec(main .. " + SHIFT + P", "hyprpicker -r -a -f hex", "Pick color as hex")
bind.exec(main .. " + CTRL + P", "hyprpicker -r -a -f rgb", "Pick color as RGB")

-- rofi
hl.bind(
   main .. " + SUPER_L",
   hl.dsp.exec_cmd("pkill rofi || " .. apps.menu .. " -replace"),
   {
      release = true,
      description = "Open application launcher",
   }
)

hl.bind(
   main .. " + R + F",
   hl.dsp.exec_cmd("pkill rofi || " .. apps.root_browser),
   {
      separate = true,
      description = "Open root/file browser",
   }
)

bind.bind(main .. " + V", hl.dsp.window.float({ action = "toggle" }), "Toggle floating")
bind.bind(main .. " + C", hl.dsp.window.close(), "Close active window")
bind.bind(main .. " + L", hl.dsp.exec_cmd(apps.lock), "Lock screen")
bind.bind(
   main .. " + S",
   hl.dsp.exec_cmd("hyprshot -m active -m output -szo ~/Documents/screenshots"),
   "Screenshot active/output"
)
bind.exec(
   main .. " + SHIFT + S",
   "hyprshot -m region -szo ~/Documents/screenshots",
   "Screenshot region"
)
bind.exec(
   main .. " + CTRL + S",
   "hyprshot -m window -szo ~/Documents/screenshots",
   "Screenshot window"
)

-- opacity toggle.
bind.bind(
   main .. " + CTRL + SHIFT + S",
   hl.dsp.window.set_prop({
      prop = "opaque",
      value = "toggle",
   }),
   "Toggle active window opacity override"
)

-- dwindle.
bind.bind(main .. " + P", hl.dsp.window.pseudo(), "Toggle pseudo-tile")

-- focus.
bind.bind(main .. " + left", hl.dsp.focus({ direction = "left" }), "Focus left")
bind.bind(main .. " + right", hl.dsp.focus({ direction = "right" }), "Focus right")
bind.bind(main .. " + up", hl.dsp.focus({ direction = "up" }), "Focus up")
bind.bind(main .. " + down", hl.dsp.focus({ direction = "down" }), "Focus down")

-- workspaces
for i = 1, 10 do
   local key = tostring(i % 10)

   bind.bind(
      main .. " + " .. key,
      hl.dsp.focus({ workspace = i }),
      "Switch to workspace " .. i
   )

   bind.bind(
      main .. " + SHIFT + " .. key,
      hl.dsp.window.move({ workspace = i }),
      "Move window to workspace " .. i
   )
end

bind.bind(
   main .. " + A",
   hl.dsp.workspace.toggle_special("magic"),
   "Toggle magic workspace"
)

bind.bind(
   main .. " + SHIFT + A",
   hl.dsp.window.move({ workspace = "special:magic" }),
   "Move window to magic workspace"
)

-- window movement / resizing.
hl.bind(
   main .. " + mouse:272",
   hl.dsp.window.drag(),
   { mouse = true, description = "Move window" }
)

hl.bind(
   main .. " + mouse:273",
   hl.dsp.window.resize(),
   { mouse = true, description = "Resize window" }
)

-- multimedia
local locked_repeat = { locked = true, repeating = true }

hl.bind(
   "XF86AudioRaiseVolume",
   hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
   locked_repeat
)

hl.bind(
   "XF86AudioLowerVolume",
   hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
   locked_repeat
)

hl.bind(
   "XF86AudioMute",
   hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
   locked_repeat
)

hl.bind(
   "XF86AudioMicMute",
   hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
   locked_repeat
)

hl.bind(
   "XF86MonBrightnessUp",
   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 2.5%+"),
   locked_repeat
)

hl.bind(
   "XF86MonBrightnessDown",
   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 2.5%-"),
   locked_repeat
)

local locked = { locked = true }

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), locked)
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"), locked)
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), locked)
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), locked)
