-- Standard awesome library
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
local user_var = require("Sources.Main.user_var")

-- Keyboard map indicator and switcher
awful.screen.connect_for_each_screen(function(s)
	s.mytextclock =  wibox.widget {
	  format = "  %d.%m.%H:%M",
	  font = user_var.font,
	  widget = wibox.widget.textclock()
	}
	s.istextclockToggled = false
end)