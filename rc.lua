-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- Theme handling library
local beautiful = require("beautiful")
require("awful.autofocus")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
-- Modules for desktop configuration
require("awful.hotkeys_popup.keys")
-- Add config for title bar of windows
require("Sources.Decorations.windowbar")
-- Add config for keybindings 
require("Sources.Bindings.keybindings")
-- Add config for error handler
require("Sources.Main.errorHandler")
-- Add config for all signals
require("Sources.Main.signals")
-- Add config for wibar
require("Sources.Decorations.panel_powerline")
-- Add config for rules
require("Sources.Main.rules")
-- Add desktop support
require("Sources.Decorations.desktop")

beautiful.init(gears.filesystem.get_configuration_dir().."Sources/Decorations/theme.lua")

awful.spawn.with_shell("xbindkeys -p")
--awful.spawn.with_shell("picom --corner-radius 0 --shadow-opacity 0 --vsync --unredir-if-possible --backend glx --glx-no-stencil --xrender-sync-fence -b")
awful.spawn.with_shell("picom --shadow-opacity 0 --corner-radius 0 --vsync --unredir-if-possible")
-- Run garbage collector regularly to prevent memory leaks
gears.timer {
    timeout = 30,
    autostart = true,
    callback = function() collectgarbage() end
}
