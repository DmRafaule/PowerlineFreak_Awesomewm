---------------------------------------------
-- Awesome theme which follows xrdb config --
--   by Yauhen Kirylau                    --
---------------------------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local gears = require("gears")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local user_var = dofile(gfs.get_configuration_dir().."Sources/Main/user_var.lua")

-- inherit default theme
local theme = dofile(themes_path.."default/theme.lua")
-- load vector assets' generators for this theme


theme.font          = user_var.font


theme.bg_normal     = xrdb.background
theme.bg_focus      = xrdb.color12
theme.bg_urgent     = xrdb.color9
theme.bg_minimize   = xrdb.color8
theme.bg_systray    = theme.bg_normal
 
theme.fg_normal     = xrdb.foreground
theme.fg_focus      = theme.bg_normal
theme.fg_urgent     = theme.bg_normal
theme.fg_minimize   = theme.bg_normal

theme.useless_gap   = dpi(5)
theme.border_width  = dpi(2)
theme.border_normal = user_var.wibox_ns
theme.border_focus  = user_var.wibox_s
theme.border_marked = xrdb.color10

theme.tasklist_bg_normal    = user_var.tasker_bg_normal
theme.tasklist_fg_normal 	= user_var.tasker_fg_normal
theme.tasklist_fg_focus 	= user_var.tasker_fg_focus
theme.tasklist_bg_focus 	= user_var.tasker_bg_focus
theme.tasklist_fg_minimize 	= user_var.tasker_fg_minimize
theme.tasklist_bg_minimize  = user_var.tasker_bg_minimize

theme.tooltip_fg = theme.fg_normal
theme.tooltip_bg = theme.bg_normal
theme.prompt_bg = user_var.runprmpt_bg

theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(26)
theme.menu_width  = dpi(100)

-- Recolor Layout icons:
theme = theme_assets.recolor_layout(theme, theme.fg_normal)

-- Recolor titlebar icons:
--
local function darker(color_value, darker_n)
    local result = "#"
    for s in color_value:gmatch("[a-fA-F0-9][a-fA-F0-9]") do
        local bg_numeric_value = tonumber("0x"..s) - darker_n
        if bg_numeric_value < 0 then bg_numeric_value = 0 end
        if bg_numeric_value > 255 then bg_numeric_value = 255 end
        result = result .. string.format("%2.2x", bg_numeric_value)
    end
    return result
end
theme = theme_assets.recolor_titlebar(
    theme, theme.fg_normal, "normal"
)
theme = theme_assets.recolor_titlebar(
    theme, darker(theme.fg_normal, -60), "normal", "hover"
)
theme = theme_assets.recolor_titlebar(
    theme, xrdb.color1, "normal", "press"
)
theme = theme_assets.recolor_titlebar(
    theme, theme.fg_focus, "focus"
)
theme = theme_assets.recolor_titlebar(
    theme, darker(theme.fg_focus, -60), "focus", "hover"
)
theme = theme_assets.recolor_titlebar(
    theme, xrdb.color1, "focus", "press"
)

theme.icon_theme = "Adwaita"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Try to determine if we are running light or dark colorscheme:
local bg_numberic_value = 0;
for s in theme.bg_normal:gmatch("[a-fA-F0-9][a-fA-F0-9]") do
    bg_numberic_value = bg_numberic_value + tonumber("0x"..s);
end
local is_dark_bg = (bg_numberic_value < 383)

-- Generate wallpaper:
local wallpaper_bg = xrdb.color4
local wallpaper_fg = xrdb.color7
local wallpaper_alt_fg = xrdb.color12
if not is_dark_bg then
    wallpaper_bg, wallpaper_fg = wallpaper_fg, wallpaper_bg
end
theme.wallpaper = function(s)
    return theme_assets.wallpaper(wallpaper_bg, wallpaper_fg, wallpaper_alt_fg, s)
end
theme.wallpaper = user_var.current_wallpaper

theme.layout_spiral         = user_var.work_layout_spiral        
theme.layout_dwindle        = user_var.work_layout_dwindle       
theme.layout_fairv          = user_var.work_layout_fairv         
theme.layout_fairh          = user_var.work_layout_fairh         
theme.layout_tiletop        = user_var.work_layout_tiletop       
theme.layout_tileleft       = user_var.work_layout_tileleft      
theme.layout_tilebottom     = user_var.work_layout_tilebottom        
theme.layout_cornersw       = user_var.work_layout_cornersw      
theme.layout_cornerse       = user_var.work_layout_cornerse      
theme.layout_cornernw       = user_var.work_layout_cornernw      
theme.layout_cornerne       = user_var.work_layout_cornerne      
theme.layout_fullscreen     = user_var.work_layout_fullscreen        
theme.layout_magnifier      = user_var.work_layout_magnifier         
theme.layout_floating       = user_var.work_layout_floating      
theme.layout_tile           = user_var.work_layout_tile      
theme.layout_max            = user_var.work_layout_max       


-- Notification stuff
theme.notification_shape = function(cr, width, height) 
    gears.shape.rounded_rect(cr, width, height,15) 
end
theme.notification_border_color = user_var.notif_brd
theme.notification_border_width = 0
theme.notification_margin = 10
theme.notification_bg = user_var.notif_b


return theme

