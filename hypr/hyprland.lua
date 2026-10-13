-- Migrado de hyprland.conf para a API Lua do Hyprland 0.56.2.
-- Os arquivos .conf originais foram preservados.
local terminal = "kitty"
local fileManager = "yazi"
local menu = "vicinae toggle"
local mainMod = "SUPER"

-- Detectar as GPUs automaticamente. Caminhos PCI com ':' não podem ser
-- usados diretamente em AQ_DRM_DEVICES: ':' separa os dispositivos.
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.monitor({ output = "HDMI-A-2", mode = "2560x1080@60", position = "1920x220", scale = 1 })
hl.monitor({ output = "eDP-1", mode = "1920x1080@144", position = "0x0", scale = 1 })
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("QT_FONT_DPI", "96")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border = "rgba(ffffff73)",
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
})

hl.config({
    cursor = {
        no_hardware_cursors = true,
    },
})

hl.window_rule({
    name = "wifitui-bluetui-imv-float-",
    match = {
        class = "^(wifitui-popup|bluetui-popup|imv)$",
    },
    float = true,
    rounding = 6,
})

hl.window_rule({
    name = "bitwarden",
    match = {
        title = "Extension: (Bitwarden Password Manager) - Bitwarden — pixor — Mozilla Firefox",
    },
    float = true,
})

hl.window_rule({
    name = "wifitui-bluetui-size",
    match = {
        class = "^(wifitui-popup|bluetui-popup)$",
    },
    size = "35% 70%",
})

hl.window_rule({
    name = "polkit-hyprland",
    match = {
        class = "^(hyprpolkitagent)$",
    },
    float = true,
    center = true,
    border_size = 0,
    rounding = 12,
    dim_around = true,
    stay_focused = true,
})

hl.window_rule({
    name = "imv-size-pin-move",
    match = {
        class = "^(imv)$",
    },
    size = "160 160",
    pin = true,
    move = "380 55",
})

hl.window_rule({
    name = "calendar-popup",
    match = {
        class = "^(cal-popup)$",
    },
    float = true,
    center = true,
    size = "300 260",
    border_size = 0,
})

hl.window_rule({
    name = "ignore-maximize",
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "xwayland-drag-fix",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.config({
    decoration = {
        rounding = 6,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = true,
            size = 2,
            passes = 1,
            vibrancy = 0.0696,
        },
    },
})

hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("almostLinear", { type = "bezier", points = { {0.5, 0.5}, {0.75, 1.0} } })
hl.curve("quick", { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.config({ animations = { enabled = true } })

hl.config({
    input = {
        kb_layout = "us,br,gr",
        kb_variant = "intl,abnt2,",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.device({
    name = "pixa3848:00-093a:3848-touchpad",
    natural_scroll = true,
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("noctalia msg panel-toggle session"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("systemctl --user start vicinae deeplink vicinae://extensions/vicinae/wm/switch-windows"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + M", hl.dsp.window.resize({ x = 0, y = 40, relative = true }))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.resize({ x = 0, y = -40, relative = true }))
hl.bind(mainMod .. " + N", hl.dsp.window.resize({ x = 40, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.window.resize({ x = -40, y = 0, relative = true }))
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1, follow = true }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2, follow = true }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3, follow = true }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4, follow = true }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5, follow = true }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6, follow = true }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7, follow = true }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8, follow = true }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9, follow = true }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10, follow = true }))
hl.bind(mainMod .. " + X", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.window.move({ workspace = "special:magic", follow = true }))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("hyprshot -m window -z"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region -z"))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
-- O .conf registra dois comandos em Super+Shift+H/J/K/L; ambos foram preservados.
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ x = -50, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ x = 50, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ x = 0, y = -50, relative = true }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ x = 0, y = 50, relative = true }))
hl.bind(mainMod .. " + SHIFT + CTRL + H", hl.dsp.window.move({ x = -10, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + CTRL + L", hl.dsp.window.move({ x = 10, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + CTRL + K", hl.dsp.window.move({ x = 0, y = -10, relative = true }))
hl.bind(mainMod .. " + SHIFT + CTRL + J", hl.dsp.window.move({ x = 0, y = 10, relative = true }))
hl.bind(mainMod .. " + B", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("trex"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t"))
hl.bind("CTRL + RETURN", hl.dsp.exec_cmd("voxtype record toggle"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.window_rule({
    name = "xwayland-video-bridge-fixes",
    match = {
        class = "xwaylandvideobridge",
    },
    no_initial_focus = true,
    no_focus = true,
    no_anim = true,
    no_blur = true,
    max_size = "1 1",
    opacity = 0.0,
})

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +10%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"))
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Autostart apenas no início da sessão (sem repetir ao recarregar).
hl.on("hyprland.start", function()
    hl.exec_cmd("noctalia & systemctl --user start vicinae")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("pidof hypridle || hypridle")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)

-- Mesma ordem dos includes do .conf: os últimos valores prevalecem.
require("hyprland-gui")
require("noctalia.noctalia-colors")

-- For Noctalia Color templates
require("noctalia").apply_theme()
