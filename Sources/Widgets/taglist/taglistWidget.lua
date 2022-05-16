-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
local gfs = require("gears.filesystem")
local user_var = dofile(gfs.get_configuration_dir() .. "Sources/Main/user_var.lua")


local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                    )


awful.screen.connect_for_each_screen(function(s)

 -- Create a taglist widget
    awful.tag.add("Coding", {
        --icon               = user_var.awesome_icon,
        layout             = awful.layout.suit.tile,
        master_fill_policy = "expand",
        screen             = s,
        selected           = true,
    })
    awful.tag.add("Exploration", {
        layout = awful.layout.suit.floating,
        screen = s,
    })

    s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    style   = {
        shape = gears.shape.powerline,
        bg_focus = "#8070D8",
        bg_volatile = "#3B2E84",
        bg_empty = "#3B2E84",
        bg_urgent = "#3B2E84",
        bg_occupied = "#3B2E84",
    },
    layout   = {
        spacing = -20,
        spacing_widget = {
            color  = '#000000',
            shape  = gears.shape.powerline,
            widget = wibox.widget.separator,
        },
        layout  = wibox.layout.fixed.horizontal
    },
    widget_template = {
        {
            {
                {
                    {
                        {
                            id     = 'index_role',
                            widget = wibox.widget.textbox,
                        },
                        margins = 0,
                        widget  = wibox.container.margin,
                    },
                    shape  = gears.shape.circle,
                    widget = wibox.container.margin,
                },
                {
                    {
                        id     = 'icon_role',
                        widget = wibox.widget.imagebox,
                    },
                    margins = 0,
                    widget  = wibox.container.margin,
                },
                {
                    id     = 'text_role',
                    widget = wibox.widget.textbox,
                },
                
                layout = wibox.layout.fixed.horizontal,
            },
            left  = 30,
            right = 30,
            widget = wibox.container.margin
        },
        
        id     = 'background_role',
        widget = wibox.container.background,
    },
    buttons = taglist_buttons
}

end)