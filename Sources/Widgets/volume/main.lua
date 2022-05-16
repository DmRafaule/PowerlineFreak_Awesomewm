-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
local gfs = require("gears.filesystem")

volume_widget = wibox.widget({ type = "textbox", name = "tb_volume",
                             align = "right" })

    function update_volume(widget)
        local fd = io.popen("amixer sget Master")
        local status = fd:read("*all")
        fd:close()
        
        local volume = tonumber(string.match(status, "(%d?%d?%d)%%")) / 100
        -- volume = string.format("% 3d", volume)

        status = string.match(status, "%[(o[^%]]*)%]")
        widget.text = volume
     end

    update_volume(volume_widget)
    awful.hooks.timer.register(1, function () update_volume(volume_widget) end)