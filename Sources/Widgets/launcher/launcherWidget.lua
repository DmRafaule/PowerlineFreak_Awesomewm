local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local menubar = require("menubar")
local naughty = require("naughty")
local gfs = require("gears.filesystem")
local user_var = dofile(gfs.get_configuration_dir() .. "Sources/Main/user_var.lua")
require("awful.autofocus")


beautiful.init(gfs.get_configuration_dir() .. "Sources/Decorations/theme.lua")


local shutdown = wibox.widget{
    {
        {
            image  = user_var.shutdown_icon,
            resize = false,
            widget = wibox.widget.imagebox
        },
        top = 1, bottom = 1, left = 1, right = 1,
        widget = wibox.container.margin
    },
    bg = '#ab0a32', -- basic
    --shape_border_width = 4, shape_border_color = '#540619', -- outline
    shape = function(cr, width, height) 
        gears.shape.rounded_bar(cr, width , height) 
    end,
    widget = wibox.container.background
}
shutdown:connect_signal("mouse::enter", function(c) c:set_bg("#00000066") end)
shutdown:connect_signal("mouse::leave", function(c) c:set_bg('#ab0a32') end)
shutdown:connect_signal("button::press", function(c) awful.spawn.with_shell("shutdown now") end)
local reboot = wibox.widget{
    {
        {
            image  = user_var.reboot_icon,
            resize = false,
            widget = wibox.widget.imagebox
        },
        top = 1, bottom = 1, left = 1, right = 1,
        widget = wibox.container.margin
    },
    bg = '#3c91ab', -- basic
    --shape_border_width = 4, shape_border_color = '#205261', -- outline
    shape = function(cr, width, height) 
        gears.shape.rounded_bar(cr, width, height) 
    end,
    widget = wibox.container.background
}
reboot:connect_signal("mouse::enter", function(c) c:set_bg("#00000066") end)
reboot:connect_signal("mouse::leave", function(c) c:set_bg("#3c91ab") end)
reboot:connect_signal("button::press", function(c) awful.spawn.with_shell("reboot") end)

local logout = wibox.widget{
    {
        {
            image  = user_var.quit_icon,
            resize = false,
            widget = wibox.widget.imagebox
        },
        top = 1, bottom = 1, left = 1, right = 1,
        widget = wibox.container.margin
    },
    bg = '#bdb440', -- basic
    --shape_border_width = 4, shape_border_color = '#7d772d', -- outline
    shape = function(cr, width, height) 
        gears.shape.rounded_bar(cr, width, height) 
    end,
    widget = wibox.container.background
}
logout:connect_signal("mouse::enter", function(c) c:set_bg("#00000066") end)
logout:connect_signal("mouse::leave", function(c) c:set_bg("#bdb440") end)
logout:connect_signal("button::press", function(c) awesome.quit() end)


sys_actions = awful.popup{
    widget = {
        {
            shutdown,
            reboot,
            logout,
            layout  = wibox.layout.fixed.horizontal,
            spacing = 10,
            widget  = wibox.container.margin
        },
        margins = 10,
        widget  = wibox.container.margin
    },
    bg = "#210f54",
    border_width = 2,
    border_color = "#213f54",
    placement    = awful.placement.bottom_right,
    shape        = function(cr, width, height) 
        gears.shape.rectangular_tag(cr, width, height, 20) 
    end,
    visible = false,
    ontop = true,
}

menubar.utils.terminal = user_var.terminal -- Set the terminal for applications that require it