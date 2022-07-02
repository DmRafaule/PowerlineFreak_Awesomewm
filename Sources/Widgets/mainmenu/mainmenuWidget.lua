local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local user_var = require("Sources.Main.user_var")

local widget = wibox.widget({
    {
        -- arrow after gap
        {
            {
                markup = '<b></b>',
                widget = wibox.widget.textbox
            },
            bg = user_var.layout_b,
            shape = gears.shape.transform(gears.shape.powerline) 
                        : scale(-1,1)
                            : translate(-20,0),
            forced_width = 20,
            widget = wibox.container.background
        },
        -- gap 
        {
            {
                markup = '<b></b>',
                widget = wibox.widget.textbox
            },
            bg = user_var.layout_b..'00',
            shape = gears.shape.transform(gears.shape.powerline) 
                        : scale(-1,1)
                            : translate(-45,0),
            forced_width = 45,
            widget = wibox.container.background
        },
        -- Apps
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
            id = 'apps_but',
            widget = wibox.container.background
        },
        -- Settings
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
            id = 'sett_but',
            widget = wibox.container.background
        },
        -- System actions
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
            id = 'main_but',
            widget = wibox.container.background
        },
        id = 'mainmenu',
        spacing = -20,
        layout = wibox.layout.fixed.horizontal
    },
    halign = 'right',
    layout = wibox.container.place
})
local apps = wibox.widget({
    spacing = -15,
    layout = wibox.layout.fixed.horizontal
})
local settings = wibox.widget({
    -- Key bindings
    {
        {
            {
                image  = user_var.reboot_icon,
                resize = true,
                widget = wibox.widget.imagebox
            },
            halign = 'center',
            widget = wibox.container.place
        },
        bg = user_var.widget_b,
        shape = gears.shape.rectangular_tag,
        id = 'keyb',
        forced_width = 75,
        widget = wibox.container.background
    },
    -- Theming
    {
        {
            {
                image  = user_var.shutdown_icon,
                resize = true,
                widget = wibox.widget.imagebox
            },
            halign = 'center',
            widget = wibox.container.place
        },
        bg = user_var.widget_b,
        shape = gears.shape.rectangular_tag,
        id = 'themes',
        forced_width = 75,
        widget = wibox.container.background
    },
    spacing = -15,
    layout = wibox.layout.fixed.horizontal
})
local sys_action = wibox.widget({
    -- Quit
    {
        {
            {
                image  = user_var.quit_icon,
                resize = true,
                widget = wibox.widget.imagebox
            },
            halign = 'center',
            widget = wibox.container.place
        },
        bg = user_var.time_b,
        shape = gears.shape.rectangular_tag,
        id = 'quit',
        forced_width = 75,
        widget = wibox.container.background
    },
    -- Reboot
    {
        {
            {
                image  = user_var.reboot_icon,
                resize = true,
                widget = wibox.widget.imagebox
            },
            halign = 'center',
            widget = wibox.container.place
        },
        bg = user_var.time_b,
        shape = gears.shape.rectangular_tag,
        id = 'reboot',
        forced_width = 75,
        widget = wibox.container.background
    },
    -- Shutdown
    {
        {
            {
                image  = user_var.shutdown_icon,
                resize = true,
                widget = wibox.widget.imagebox
            },
            halign = 'center',
            widget = wibox.container.place
        },
        bg = user_var.time_b,
        shape = gears.shape.rectangular_tag,
        id = 'shutdown',
        forced_width = 75,
        widget = wibox.container.background
    },
    spacing = -15,
    layout = wibox.layout.fixed.horizontal
})

-- APPS
widget:get_children_by_id('apps_but')[1]:connect_signal('mouse::enter',function(c) c:set_bg(user_var.layout_b_hovered) end)
widget:get_children_by_id('apps_but')[1]:connect_signal("mouse::leave", function(c) c:set_bg(user_var.layout_b) end)
widget:get_children_by_id('apps_but')[1]:connect_signal("button::press", function(c)
    -- Here show all GUI apps in system
end)

-- SETTINGS
widget:get_children_by_id('sett_but')[1]:connect_signal('mouse::enter',function(c) c:set_bg(user_var.widget_b_hovered) end)
widget:get_children_by_id('sett_but')[1]:connect_signal("mouse::leave", function(c) c:set_bg(user_var.widget_b) end)
widget:get_children_by_id('sett_but')[1]:connect_signal("button::press", function(c)
    widget:get_children_by_id('mainmenu')[1]:remove_widgets(apps)
    widget:get_children_by_id('mainmenu')[1]:remove_widgets(settings)
    widget:get_children_by_id('mainmenu')[1]:remove_widgets(sys_action)
    widget:get_children_by_id('mainmenu')[1]:insert(4, settings)
end)
settings:get_children_by_id('keyb')[1]:connect_signal('mouse::enter', function (c) c:set_bg(user_var.widget_b_hovered) end)
settings:get_children_by_id('keyb')[1]:connect_signal('mouse::leave', function (c) c:set_bg(user_var.widget_b) end)
settings:get_children_by_id('keyb')[1]:connect_signal('button::press', function (c) 

end)
settings:get_children_by_id('themes')[1]:connect_signal('mouse::enter', function (c) c:set_bg(user_var.widget_b_hovered) end)
settings:get_children_by_id('themes')[1]:connect_signal('mouse::leave', function (c) c:set_bg(user_var.widget_b) end)
settings:get_children_by_id('themes')[1]:connect_signal('button::press', function (c) 

end)

-- MAIN LAUNCHER
widget:get_children_by_id('main_but')[1]:connect_signal('mouse::enter',function(c) c:set_bg(user_var.time_b_hovered) end)
widget:get_children_by_id('main_but')[1]:connect_signal("mouse::leave", function(c) c:set_bg(user_var.time_b) end)
widget:get_children_by_id('main_but')[1]:connect_signal("button::press", function(c)
    -- Here show all system actions
    widget:get_children_by_id('mainmenu')[1]:remove_widgets(apps)
    widget:get_children_by_id('mainmenu')[1]:remove_widgets(settings)
    widget:get_children_by_id('mainmenu')[1]:remove_widgets(sys_action)
    widget:get_children_by_id('mainmenu')[1]:insert(5, sys_action)
end)
sys_action:get_children_by_id('quit')[1]:connect_signal('mouse::enter', function (c) c:set_bg(user_var.time_b_hovered) end)
sys_action:get_children_by_id('quit')[1]:connect_signal('mouse::leave', function (c) c:set_bg(user_var.time_b) end)
sys_action:get_children_by_id('quit')[1]:connect_signal('button::press', function (c) 
    awesome.quit()
end)
sys_action:get_children_by_id('reboot')[1]:connect_signal('mouse::enter', function (c) c:set_bg(user_var.time_b_hovered) end)
sys_action:get_children_by_id('reboot')[1]:connect_signal('mouse::leave', function (c) c:set_bg(user_var.time_b) end)
sys_action:get_children_by_id('reboot')[1]:connect_signal('button::press', function (c) 
    awful.spawn.with_shell("reboot")
end)
sys_action:get_children_by_id('shutdown')[1]:connect_signal('mouse::enter', function (c) c:set_bg(user_var.time_b_hovered) end)
sys_action:get_children_by_id('shutdown')[1]:connect_signal('mouse::leave', function (c) c:set_bg(user_var.time_b) end)
sys_action:get_children_by_id('shutdown')[1]:connect_signal('button::press', function (c) 
    awful.spawn.with_shell("shutdown now")
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