-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local naughty = require("naughty")
-- Theme handling library
local beautiful = require("beautiful")
local theme     = require("Sources.Decorations.theme")
local user_var  = require("Sources.Main.user_var")
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

beautiful.init(gears.filesystem.get_configuration_dir().."Sources/Decorations/theme.lua")

awful.spawn.with_shell("kill -9 $( pidof xbindkeys) ; xbindkeys -p")
--awful.spawn.with_shell("picom --corner-radius 0 --shadow-opacity 0 --vsync --unredir-if-possible --backend glx --glx-no-stencil --xrender-sync-fence -b")
awful.spawn.with_shell("picom --shadow-opacity 0 --corner-radius 0 --vsync --unredir-if-possible") -- --backend xr_glx_hybrid --use-damage --glx-no-stencil
-- Run garbage collector regularly to prevent memory leaks
gears.timer {
    timeout = 30,
    autostart = true,
    callback = function() collectgarbage() end
}
gears.timer {
    timeout = 300,
    autostart = true,
    callback = function ()
        --local function scanDir(directory)
            --local i, fileList, popen = 0, {}, io.popen
            --for filename in popen([[find "]] ..directory.. [[" -type f]]):lines() do
            --    i = i + 1
            --    fileList[i] = filename
            --end
            --return fileList
            --end
        --local wallpaperList = scanDir(gears.filesystem.get_configuration_dir().. "Pictures/Wallpapers")

        --awful.screen.connect_for_each_screen(function(s) 
        --    local function set_wallpaper (s)
        --        -- Wallpaper
        --        if beautiful.wallpaper then
        --            --local wallpaper = wallpaperList[math.random(1, #wallpaperList)]
        --            -- If wallpaper is a function, call it with the screen
        --            if type(wallpaper) == "function" then
        --                wallpaper = wallpaper(s)
        --            end
        --            gears.wallpaper.maximized(wallpaper, s, true)
        --        end
        --    end
        --    set_wallpaper(s)
        --end)
    end
}
