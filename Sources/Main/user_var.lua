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
	charge_required = gfs.get_configuration_dir().."Pictures/Icons/status/battery-caution-symbolic.svg",
	shutdown_icon = gfs.get_configuration_dir().."Pictures/Icons/system-shutdown.svg",
	reboot_icon = gfs.get_configuration_dir().."Pictures/Icons/system-reboot.svg",
	quit_icon = gfs.get_configuration_dir().."Pictures/Icons/system-log-out.svg",
	ru_layout_icon = gfs.get_configuration_dir().."Pictures/Icons/ru.png",
	us_layout_icon = gfs.get_configuration_dir().."Pictures/Icons/us.png",
	minus = gfs.get_configuration_dir().."Pictures/Icons/minus.svg",
	plus  = gfs.get_configuration_dir().."Pictures/Icons/plus.svg",
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
	current_wallpaper = gfs.get_configuration_dir().. "Pictures/Wallpapers/21.jpg",
	-- Font 
	font = "Sans 12",
	-- Colors
	-- Wibar
	wibox_b = "#27222e00",
	-- Taglisty
	taglist_s = "#8070D8",
	taglist_ns = "#3B2E84",
	-- Runprompt
	runprmpt_bg = "#8060FF",
	runprmpt_brd = "#8070d9",
	runprmpt_choise_brd = "#8070d9",
	runprmpt_choise_bg = "#8060FF90",
	runprmpt_choise_f = "#000000",
	runprmpt_choise_s = "#7BC9E5",
	runprmpt_choise_ns = "#8060FF90",
	runprmpt_counter_b = "#ef3c7b90",
	runprmpt_counter_f = "#000000",
	runprmpt_counter_brd = "#8070d9",
	runprmpt_f = "#000000",
	runprmpt_cursor = "#fff",
	-- Tasklist
	tasker_brd 			= '#7A45D6',
	tasker_separator 	= "#7A45D6",
	tasker_bg_normal    = "#8070D8",
	tasker_fg_normal 	= "#000000",
	tasker_fg_focus 	= "#000000",
	tasker_bg_focus 	= "#6990D8",
	tasker_fg_minimize 	= "#ffffff9f",
	tasker_bg_minimize  = "#ffffff1f",
	-- Wiboxes
	wibox_ns = '#3B2E84',
	wibox_s  = '#8070D8',
	-- Notifications
	notif_b = "#31196160",
	notif_brd = "#8070D8",
	-- Widgets
	first_arrow = "#8070D8",
	layout_b  = "#EF3C7B",
	widget_b  = "#9702A7",
	time_b    = "#2F0571"
}
return _M
