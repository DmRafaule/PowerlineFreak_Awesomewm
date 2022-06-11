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
require("Sources.Widgets.work_layout.layoutWidget")
local user_var = require("Sources.Main.user_var")
dofile(gfs.get_configuration_dir() .. "Sources/Widgets/tasklist/tasklistWidget.lua")
dofile(gfs.get_configuration_dir() .. "Sources/Widgets/taglist/taglistWidget.lua")
dofile(gfs.get_configuration_dir() .. "Sources/Widgets/launcher/launcherWidget.lua")
dofile(gfs.get_configuration_dir() .. "Sources/Widgets/keyboard_layout/kl.lua")
dofile(gfs.get_configuration_dir() .. "Sources/Widgets/time/timeWidget.lua")
dofile(gfs.get_configuration_dir() .. "Sources/Widgets/systray/systrayWidget.lua")
dofile(gfs.get_configuration_dir() .. "Sources/Widgets/prompt/promptWidget.lua")
dofile(gfs.get_configuration_dir() .. "Sources/Main/user_var.lua")

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
-- CALENDAR WIDGET
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
local cw = calendar_widget({
    theme = 'nord',
    placement = 'bottom_right',
    start_sunday = false,
    radius = 8,
    previous_month_button = 1,
    next_month_button = 3,
})
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

    s.main_wibox = awful.wibar({
        position = "bottom", 
        screen = s,
        bg = user_var.wibox_b,
    })
    s.main_wibox:setup {
        -- left widgets
        {
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
        },
        -- place holder
        {
            layout = wibox.layout.align.horizontal,
        },
        -- right widget
        {
            -- first arrow
            wibox.widget{
                shape = gears.shape.powerline,
                widget = wibox.container.background,
                resize = true,
            },
            -- systray
            s.mysystray,
            spacing = 20,
            spacing_widget = {
                color  = user_var.first_arrow,
                shape  = arrow,
                widget = wibox.widget.separator,
            },
            -- all sticked widgets
            {
                -- powerline behind all sticked widgets like layout, time calendar, layout box
                {-- First arrow
                    {
                        {
                            markup = "<b></b>",
                            widget = wibox.widget.textbox
                        },
                        bg     = user_var.layout_b,
                        shape = function(cr, width, height) 
                            gears.shape.rectangular_tag(cr, width, height, 10) 
                        end,
                        widget = wibox.container.background
                    },
                    left   = -20,
                    layout = wibox.container.margin
                },
                {-- Second arrow
                    {
                        {
                            markup = "<b></b>",
                            widget = wibox.widget.textbox
                        },
                        bg     = user_var.widget_b,
                        shape = gears.shape.transform(gears.shape.powerline) 
                        : scale(-1,1)
                            : translate(-360,0),
                        widget = wibox.container.background
                    },
                    left   = -20,
                    layout = wibox.container.margin
                },
                {-- Third arrow
                    {
                        {
                            markup = "<b></b>",
                            widget = wibox.widget.textbox
                        },
                        bg     = user_var.time_b,
                        shape = gears.shape.transform(gears.shape.powerline) 
                        : scale(-1,1)
                            : translate(-480,0),
                        widget = wibox.container.background
                    },
                    left   = -20,
                    layout = wibox.container.margin
                },
                -- widgets by it self
                {
                    spacing = 10,
                    s.kbdcfg.widget,
                    net_wired,
                    brightness_widget({
                        type = 'arc',
                        program = 'xbacklight',
                        timeout = 1,
                        step = 20, 
                        tooltip = true,
                    }),
                    volume_widget({
                        widget_type = 'arc',
                        size = 18,
                        step = 5,
                        device = "default",
                    }),
                    battery_widget({
                        font = "Play 7",
                        timeout = 10,
                        notification_position = "top_left",
                        show_current_level = false,
                        warning_msg_title = "Charge Now !!!",
                        warning_msg_text = "Battery have to eat too.",
                        warning_msg_icon = user_var.charge_required,
                    }),
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
                    s.mylayoutbox,
                    layout = wibox.layout.fixed.horizontal,
                },
                
                layout = wibox.layout.stack,
            },
            layout = wibox.layout.fixed.horizontal,
        },
        layout = wibox.layout.align.horizontal,
    }
    -- This is a reinvented dmenu(a simplier one)
    s.prompt_wibox = wibox({
      x = -25,
      y = s.workarea.height - s.main_wibox.height,
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
