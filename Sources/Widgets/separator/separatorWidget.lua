local wibox = require("wibox")
local awful = require('awful')
local gfs = require("gears.filesystem")
local user_var = dofile(gfs.get_configuration_dir() .. "Sources/Main/user_var.lua")

awful.screen.connect_for_each_screen(function(s) 
	-- Separators
	s.leftArrowSep = wibox.widget{
	    widget = wibox.widget.imagebox,
	    resize = true,
	    image  = user_var.arrow_left_icon,
	}
	s.rightArrowSep = wibox.widget{
	    widget = wibox.widget.imagebox,
	    resize = true,
	    image  = user_var.arrow_right_icon,
	}
end)