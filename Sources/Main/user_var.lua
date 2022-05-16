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
	launcher_icon = gfs.get_configuration_dir().."Pictures/Icons/arch.svg",
	awesome_icon = home.."/.icons/Infinity-Dark-Icons/actions/22/im-user.svg",
	file_manager_icon = home.."/.icons/Infinity-Dark-Icons/places/64/user-home.svg", --"/home/dimond/.icons/Infinity-Dark-Icons/actions/24/document-open.svg",
	browser_icon = home.."/.icons/Infinity-Dark-Icons/actions/16/globe.svg",
	editor_icon = home.."/.icons/Infinity-Dark-Icons/actions/16/format-text-code.svg",
	terminal_icon = home.."/.icons/Infinity-Dark-Icons/actions/16/dialog-scripts.svg",
	apps_icon = home.."/.icons/Infinity-Dark-Icons/actions/16/im-msn.svg",
	shutdown_icon = home.."/.icons/Mega-Dark-Icons/actions/32@3x/system-shutdown.svg",
	restart_icon = home.."/.icons/Mega-Dark-Icons/actions/16@3x/view-refresh.svg",
	reboot_icon = home.."/.icons/Mega-Dark-Icons/actions/32@3x/system-reboot.svg",
	quit_icon = home.."/.icons/Mega-Dark-Icons/actions/32@3x/system-log-out.svg",
	ru_layout_icon = gfs.get_configuration_dir().."Pictures/Icons//ru.png",
	us_layout_icon = gfs.get_configuration_dir().."Pictures/Icons//us.png",
	arrow_left_icon = gfs.get_configuration_dir().. "Pictures/Icons/arrow-30.png",
	arrow_right_icon = gfs.get_configuration_dir().. "Pictures/Icons/right_arrow-30.png",
	calendar_icon = "/home/dimond/.icons/Infinity-Dark-Icons/actions/16/view-calendar-week.svg",
	net_icon = "/home/dimond/.icons/Infinity-Dark-Icons/apps/22/akregator.svg",
	battery_icon = "/home/dimond/.icons/Infinity-Dark-Icons/devices/64/battery.svg",
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
