local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local gfs = require("gears.filesystem")
local user_var = dofile(gfs.get_configuration_dir() .. "Sources/Main/user_var.lua")
local naughty = require("naughty")
require("awful.hotkeys_popup.keys")
require("awful.autofocus")

modkey = user_var.modkey
isWibasToggled = true
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    --awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}
local amp = '&amp'..string.char(0x3B)
-- {{{ Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),
    -- Increase width
    awful.key({ modkey,           }, "l",
        function ()
          awful.tag.incmwfact( 0.05)
        end,
        {description = "increase master width factor", group = "layout"}
    ),
    -- Decrease width 
    awful.key({ modkey,           }, "h",
        function ()
          awful.tag.incmwfact(-0.05)
        end,
        {description = "decrease master width factor", group = "layout"}
    ),
    -- Next wind
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    -- Prev wind
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
	  -- Changing keyboard layout
    awful.key({"Shift"}, "Alt_L", 
      function () 
        awful.screen.connect_for_each_screen(function (s)
          s.kbdcfg.switch_next()   
        end)  
      end),
    -- Hide wibar
    awful.key({nil,},"Menu",
      function()
        awful.screen.connect_for_each_screen(function (s)
          if s.main_wibox.visible then
            s.main_wibox.visible = false
          else
            s.main_wibox.visible = true
          end
        end)
      end,
      {description= "showup wibar menu",group = "client"}),
    awful.key({modkey},           "Tab",
      function ()
        awful.screen.connect_for_each_screen(function (s)
          if (s.mainmenu.visible) then
            s.mainmenu.visible = false
            s.rightwibar.visible = true
          else
            s.mainmenu.visible = true
            s.rightwibar.visible = false
          end
        end)
      end,
      {description = "Open main launcher", group = "launcher"}
    ),
    -- Standard program
    awful.key({ modkey,           }, "t", function () awful.spawn(user_var.terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey,           }, "c", function () awful.spawn.with_shell("kitty "..user_var.editor) end,
              {description = "open a code editor", group = "launcher"}),              
    awful.key({ modkey,           }, "b", function () awful.spawn(user_var.browser) end,
              {description = "open a default browser", group = "launcher"}),
    awful.key({ modkey,           }, "m", function () awful.spawn.with_shell("kitty "..user_var.fm) end,
              {description = "open a file manager", group = "launcher"}),
    awful.key({ }, "Print", function () awful.util.spawn("flameshot gui") end),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
    awful.key({ modkey, "Control" }, "n",
      function ()
        local c = awful.client.restore()
        -- Focus restored client
        if c then
          c:emit_signal(
              "request::activate", "key.unminimize", {raise = true}
          )
        end
      end,
      {description = "restore minimized", group = "client"}),
    -- Prompt
    awful.key({ modkey },            "r",
      function()
        awful.screen.connect_for_each_screen(function (s)
          if s.prompt_wibox.visible then
            s.leftwibar.visible = true
            s.prompt_wibox.visible = false
          else
            s.leftwibar.visible = false
            s.prompt_wibox.visible = true
            s.prompt_wibox.widget:run()
          end
        end)
      end,
      {description = "run prompt", group = "launcher"})
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ nil,   }, "F4",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"})
)

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}
