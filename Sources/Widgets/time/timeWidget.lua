-- Standard awesome library
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")

-- Keyboard map indicator and switcher
awful.screen.connect_for_each_screen(function(s)
	s.mytextclock =  wibox.widget {
	  format = "  %d.%m.%H:%M",
	  widget = wibox.widget.textclock()
	}
	s.istextclockToggled = false
end)