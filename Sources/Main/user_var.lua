local gfs = require("gears.filesystem")
local home = os.getenv("HOME")
local _M = {
	-- Default applications
	browser = "firefox",
	fm = "thunar",
	editor = "code",
	terminal = "kitty",
	-- Mod key (win in my case)
	modkey = "Mod4",
	-- Icons
	shutdown_icon = gfs.get_configuration_dir().."Pictures/Icons/system-shutdown.svg",
	reboot_icon = gfs.get_configuration_dir().."Pictures/Icons/system-reboot.svg",
	quit_icon = gfs.get_configuration_dir().."Pictures/Icons/system-log-out.svg",
	ru_layout_icon = gfs.get_configuration_dir().."Pictures/Icons//ru.png",
	us_layout_icon = gfs.get_configuration_dir().."Pictures/Icons//us.png",
	-- Work layout
	work_layout_spiral = gfs.get_configuration_dir().. "Pictures/Icons/spiral.png",
	work_layout_dwindle = gfs.get_configuration_dir().. "Pictures/Icons/dwindle.png",
	work_layout_fairv = gfs.get_configuration_dir().. "Pictures/Icons/fairv.png",
	work_layout_fairh = gfs.get_configuration_dir().. "Pictures/Icons/fairh.png",
	work_layout_tiletop = gfs.get_configuration_dir().. "Pictures/Icons/tiletop.png",
	work_layout_tileleft = gfs.get_configuration_dir().. "Pictures/Icons/tileleft.png",
	work_layout_tilebottom = gfs.get_configuration_dir().. "Pictures/Icons/tilebottom.png",
	work_layout_cornersw = gfs.get_configuration_dir().. "Pictures/Icons/cornersw.png",
	work_layout_cornerse = gfs.get_configuration_dir().. "Pictures/Icons/cornerse.png",
	work_layout_cornernw = gfs.get_configuration_dir().. "Pictures/Icons/cornernw.png",
	work_layout_cornerne = gfs.get_configuration_dir().. "Pictures/Icons/cornerne.png",
	work_layout_fullscreen = gfs.get_configuration_dir().. "Pictures/Icons/fullscreen.png",
	work_layout_magnifier = gfs.get_configuration_dir().. "Pictures/Icons/magnifier.png",
	work_layout_floating = gfs.get_configuration_dir().. "Pictures/Icons/floating.png",
	work_layout_tile = gfs.get_configuration_dir().. "Pictures/Icons/tile.png",
	work_layout_max = gfs.get_configuration_dir().. "Pictures/Icons/max.png",
	-- Wallpapers
	hex_wallpaper = gfs.get_configuration_dir().. "Pictures/Wallpapers/minimalist-abstract-hexagon-colorful-a1949.jpg",
	night_wallpaper = gfs.get_configuration_dir().. "Pictures/Wallpapers/snow-mountain-night-landscape-minimalist-minimalism-y739.jpg",
	teahub_wallpaper = gfs.get_configuration_dir().. "Pictures/Wallpapers/teahub.io-landscape-wallpaper-12770.png",
}
return _M
