local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local menubar = require("menubar")
local gfs = require("gears.filesystem")
local user_var = dofile(gfs.get_configuration_dir() .. "Sources/Main/user_var.lua")


awful.screen.connect_for_each_screen(function(s)

    -- the systray has its own internal background because of X11 limitations
    s.mysystray = wibox.widget.systray()
    
end)