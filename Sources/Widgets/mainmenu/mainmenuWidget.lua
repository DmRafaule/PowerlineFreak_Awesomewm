local awful = require("awful")
local naughty = require("naughty")
local wibox = require("wibox")
local io    = require("io")
local gears = require("gears")
local user_var = require("Sources.Main.user_var")


local widget = wibox.widget({
    {
        {
            {
                {
                    image  = user_var.apps,
                    resize = true,
                    widget = wibox.widget.imagebox
                },
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
        {
            {
                {
                    image  = user_var.settings,
                    resize = true,
                    widget = wibox.widget.imagebox
                },
                halign = 'center',
                widget = wibox.container.place
            },
            bg = user_var.widget_b,
            shape = gears.shape.transform(gears.shape.powerline) 
                        : scale(-1,1)
                            : translate(-75,0),
            forced_width = 75,
            id = 'sett',
            widget = wibox.container.background
        },
        {
            {
                {
                    image  = user_var.arch,
                    resize = true,
                    widget = wibox.widget.imagebox
                },
                halign = 'center',
                widget = wibox.container.place
            },
            bg = user_var.time_b,
            shape = gears.shape.rectangular_tag,
            forced_width = 75,
            id = 'main',
            widget = wibox.container.background
        },
        spacing = -20,
        layout = wibox.layout.fixed.horizontal
    },
    halign = 'right',
    layout = wibox.container.place
})
-- Apps 
widget:get_children_by_id('apps')[1]:connect_signal('mouse::enter',function(c) c:set_bg(user_var.layout_b_hovered) end)
widget:get_children_by_id('apps')[1]:connect_signal("mouse::leave", function(c) c:set_bg(user_var.layout_b) end)
widget:get_children_by_id('apps')[1]:connect_signal("button::press", function(c)
    -- Here show all GUI apps in system
end)
-- Settings
widget:get_children_by_id('sett')[1]:connect_signal('mouse::enter',function(c) c:set_bg(user_var.widget_b_hovered) end)
widget:get_children_by_id('sett')[1]:connect_signal("mouse::leave", function(c) c:set_bg(user_var.widget_b) end)
widget:get_children_by_id('sett')[1]:connect_signal("button::press", function(c)
    -- Here show all settings
end)
-- Main launcher
widget:get_children_by_id('main')[1]:connect_signal('mouse::enter',function(c) c:set_bg(user_var.time_b_hovered) end)
widget:get_children_by_id('main')[1]:connect_signal("mouse::leave", function(c) c:set_bg(user_var.time_b) end)
widget:get_children_by_id('main')[1]:connect_signal("button::press", function(c)
    -- Here show all system actions
end)

awful.screen.connect_for_each_screen(function (s)
    local width = s.workarea.width
    local height = 25
    s.mainmenu = wibox({
        x = s.workarea.width - width,
        y = s.workarea.height - height,
        visible = false,
        width = width,
        height = height,
        border_width = 0,
        border_color = user_var.mm_brd,
        bg = user_var.mm_b..'00',
        ontop = true,
        screen = s,
        widget = widget,
    })
end)