-- Standard awesome library
local base = require("wibox.widget.base")
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
local gfs = require("gears.filesystem")
local user_var = require("Sources.Main.user_var")

require("Sources.Widgets.work_layout.layoutWidget")
dofile(gfs.get_configuration_dir() .. "Sources/Widgets/tasklist/tasklistWidget.lua")
dofile(gfs.get_configuration_dir() .. "Sources/Widgets/taglist/taglistWidget.lua")
dofile(gfs.get_configuration_dir() .. "Sources/Widgets/keyboard_layout/kl.lua")
dofile(gfs.get_configuration_dir() .. "Sources/Widgets/time/timeWidget.lua")
dofile(gfs.get_configuration_dir() .. "Sources/Widgets/systray/systrayWidget.lua")
dofile(gfs.get_configuration_dir() .. "Sources/Widgets/prompt/promptWidget.lua")
dofile(gfs.get_configuration_dir() .. "Sources/Widgets/mainmenu/mainmenuWidget.lua")
dofile(gfs.get_configuration_dir() .. "Sources/Main/user_var.lua")

beautiful.init(gears.filesystem.get_configuration_dir().."Sources/Decorations/theme.lua")

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end


-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

local arrow = gears.shape.transform(gears.shape.powerline) 
    : scale(-1,1)
        : translate(-20,0)
-- BATTERY WIDGET
local battery_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc")
-- VOLUME WIDGET
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
-- BRIGHTNESS WIDGET
local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")
-- NET WIDGET
local net_widgets = require("net_widgets")
local net_wired = net_widgets.indicator({
    interface = "nil",
    timeout     = 5,
    popup_position = "bottom_right",
})

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)
    -- LAYOUT WIDGET
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end))
    )
    s.leftwibar = wibox.widget({
        {
            -- Force the textbox to always be 300 pixel long
            {
                {
                    markup = "<b>               </b>",
                    align  = "left",
                    widget = s.mytaglist,
                },
                shape = gears.shape.rect,
                widget = wibox.container.background,
            },
            width    = 300,
            left = -20,
            strategy = "min",
            layout   = wibox.container.margin,
        },
        {
            {
                {
                    markup = "<b></b>",
                    widget = s.mytasklist
                },
                shape = gears.shape.powerline,
                widget = wibox.container.background
            },
            left   = -10,
            layout = wibox.container.margin
        },
        layout = wibox.layout.fixed.horizontal,
    })
    s.centerwibar = wibox.widget({
        layout = wibox.layout.align.horizontal,
    })
    s.rightwibar = wibox.widget({
        -- line after gap
        {
            {
                markup = '<b></b>',
                widget = wibox.widget.textbox
            },
            bg = user_var.layout_b,
            shape = gears.shape.transform(gears.shape.powerline) 
                        : scale(-0.5,1)
                            : translate(-35,0),
            forced_width = 35,
            widget = wibox.container.background
        },
        -- systray
        s.mysystray,
        -- gap between layout and systray
        {
            {
                markup = '<b></b>',
                widget = wibox.widget.textbox
            },
            bg = user_var.layout_b..'00',
            shape = gears.shape.transform(gears.shape.powerline) 
                        : scale(-1,1)
                            : translate(-35,0),
            forced_width = 35,
            widget = wibox.container.background
        },
        -- layout
        {
            {
                s.kbdcfg.widget,
                halign = 'center',
                widget = wibox.container.place
            },
            bg = user_var.layout_b,
            shape = gears.shape.transform(gears.shape.powerline) 
                        : scale(-1,1)
                            : translate(-75,0),
            forced_width = 75,
            id = 'apps',
            widget = wibox.container.background
        },
        -- net
        {
            {
                net_wired,
                halign = 'center',
                widget = wibox.container.place
            },
            bg = user_var.widget_b,
            shape = gears.shape.transform(gears.shape.powerline) 
                        : scale(-1,1)
                            : translate(-50,0),
            forced_width = 50,
            id = 'sett',
            widget = wibox.container.background
        },
        -- Brightness
        {
            {
                brightness_widget({
                    type = 'arc',
                    program = 'xbacklight',
                    timeout = 1,
                    step = 20, 
                    tooltip = true,
                }),
                halign = 'center',
                widget = wibox.container.place
            },
            bg = user_var.widget_b,
            shape = gears.shape.transform(gears.shape.powerline) 
                        : scale(-1,1)
                            : translate(-50,0),
            forced_width = 50,
            id = 'sett',
            widget = wibox.container.background
        },
        -- Volume
        {
            {
                volume_widget({
                    widget_type = 'arc',
                    size = 18,
                    step = 5,
                    device = "default",
                }),
                halign = 'center',
                widget = wibox.container.place
            },
            bg = user_var.widget_b,
            shape = gears.shape.transform(gears.shape.powerline) 
                        : scale(-1,1)
                            : translate(-50,0),
            forced_width = 50,
            id = 'sett',
            widget = wibox.container.background
        },
        -- Battery
        {
            {
                battery_widget({
                    font = "Play 7",
                    timeout = 10,
                    notification_position = "top_left",
                    show_current_level = false,
                    warning_msg_title = "Charge Now !!!",
                    warning_msg_text = "Battery have to eat too.",
                    warning_msg_icon = user_var.charge_required,
                }),
                halign = 'center',
                widget = wibox.container.place
            },
            bg = user_var.widget_b,
            shape = gears.shape.transform(gears.shape.powerline) 
                        : scale(-1,1)
                            : translate(-50,0),
            forced_width = 50,
            id = 'sett',
            widget = wibox.container.background
        },
        -- Textclock
        {
            {
                s.mytextclock,
                s.mytextclock:connect_signal("button::press",
                    function(_, _, _, button)
                        if button == 1 then 
                            if s.istextclockToggled == false then
                                s.istextclockToggled = true
                                awful.spawn.with_shell("kitty calcurse") 
                            else
                                s.istextclockToggled = false
                                awful.spawn.with_shell("kill -9 $( pidof calcurse)")
                            end
                        end
                    end),
                halign = 'center',
                widget = wibox.container.place
            },
            bg = user_var.time_b,
            shape = gears.shape.rectangular_tag,
            forced_width = 150,
            id = 'main',
            widget = wibox.container.background
        },
        -- Layoutbox
        {
            {
                s.mylayoutbox,
                halign = 'right',
                widget = wibox.container.place
            },
            bg = user_var.time_b,
            shape = gears.shape.rectangular_tag,
            forced_width = 25,
            id = 'main',
            widget = wibox.container.background
        },
        spacing = -15,
        layout = wibox.layout.fixed.horizontal,
    })
    s.main_wibox = awful.wibar({
        position = "bottom", 
        screen = s,
        bg = user_var.wibox_b,
    })
    s.main_wibox:setup {
        s.leftwibar,
        s.centerwibar,
        s.rightwibar,
        layout = wibox.layout.align.horizontal,
    }
    -- RUNPROMPT WIDGET
    s.prompt_wibox = wibox({
        x = -25,
        y = s.workarea.height,
        visible = false,
        width = 200,
        height = s.main_wibox.height,
        border_width = 0,
        border_color = user_var.runprmpt_brd,
        bg = user_var.runprmpt_bg,
        ontop = true,
        shape = function (cr,width,height)
            gears.shape.powerline(cr,width,height)
        end,
        screen = s,
        widget = s.mypromptbox
    })
end)
-- }}}
