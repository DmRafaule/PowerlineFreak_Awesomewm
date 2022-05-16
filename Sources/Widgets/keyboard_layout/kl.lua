-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Theme handling library
local gfs = require("gears.filesystem")
local user_var = dofile(gfs.get_configuration_dir() .. "Sources/Main/user_var.lua")
local kl = require("Sources.Widgets.keyboard_layout")


-- Keyboard map indicator and switcher
awful.screen.connect_for_each_screen(function(s)
	s.mykeyboardlayout = awful.widget.keyboardlayout()
	awful.client.focus.kbd_layout = "ru" -- here
	s.kbdcfg = kl.kbdcfg({type = "gui"})

	s.kbdcfg.add_primary_layout("English", user_var.us_layout_icon, "us")
	s.kbdcfg.add_primary_layout("Русский", user_var.ru_layout_icon, "ru")

	s.kbdcfg.bind()

	-- Mouse bindings
	s.kbdcfg.widget:buttons(
		awful.util.table.join(awful.button({ }, 1, function () s.kbdcfg.switch_next() end),
						  awful.button({ }, 3, function () s.kbdcfg.menu:toggle() end))
    )

end)


