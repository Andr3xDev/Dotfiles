-- Abysal Obsidian
return {
	-- Base colors
	base    = "rgb(0e161a)", -- main_background
	surface = "rgb(152025)", -- secondary_background
	text    = "rgb(e3e9eb)", -- main_text

	-- Palette
	color1 = "rgb(2dd4bf)", -- turquoise
	color2 = "rgb(d9973a)", -- orange
	color3 = "rgb(e9d568)", -- sand
	color4 = "rgb(ff6369)", -- soft_red
	color5 = "rgb(6c93e8)", -- steel_blue
	color6 = "rgb(ab8ab7)", -- lavender_purple
	color7 = "rgb(7a8b8e)", -- light_gray_secondary
	color8 = "rgb(5b6e72)", -- medium_gray_comments
	color9 = "rgb(1d2c34)", -- dark_gray_borders

	-- Highlight colors
	highlight1 = "rgb(152025)", -- faint_selection
	highlight2 = "rgb(324a54)", -- medium_selection
	highlight3 = "rgb(516e7a)", -- strong_selection

	-- Wallpaper
	wallpaper = "~/.config/wallpapers/tkg.jpg",

	-- Border configuration
	border_active   = "rgb(1d2c34)", -- Gray focus          ($highlight3)
	border_inactive = "rgb(19262c)", -- Darker gray borders ($color9)
	border_urgent   = "rgb(ff6369)", -- Soft Red            ($color4)

	-- Shadows
	shadow_active   = "rgba(11111b70)",
	shadow_inactive = "rgba(00000000)",

	-- Opacity
	opacity = 0.95,

	-- Hyprlock specifics
	lock_background_brightness = 0.8,
	lock_backsurface  = "rgba(14, 22, 26, 0.95)",
	lock_border_color = "rgba(50, 74, 84, 1)",

	lock_text         = "rgb(e3e9eb)", -- $text
	lock_shadow       = "rgb(0e161a)", -- $base

	lock_time_hours   = "rgb(e3e9eb)", -- $text
	lock_time_date    = "rgb(d9973a)", -- $color2

	lock_input_bg     = "rgb(152025)", -- $surface
	lock_input_border = "rgb(2dd4bf)", -- $color1
	lock_input_text   = "rgb(e3e9eb)", -- $text

	lock_actions_border = "rgb(2dd4bf)", -- $color1
	lock_actions_text   = "rgb(e3e9eb)", -- $text

	lock_battery_bg     = "rgb(152025)", -- $surface
	lock_battery_border = "rgb(2dd4bf)", -- $color1
	lock_battery_text   = "rgb(e3e9eb)", -- $text
}
