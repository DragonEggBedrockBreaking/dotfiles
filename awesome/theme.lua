local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local themes_path = require("gears.filesystem").get_themes_dir()

-- BASICS
local theme = {}
theme.font          = "FantasqueSans 8"

theme.useless_gap   = dpi(10)
theme.border_width  = dpi(8)
theme.border_normal = "#14ff1b"
theme.border_focus  = "#00158f"

-- IMAGES
theme.layout_tile = themes_path .. "sky/layouts/tile.png"

-- MISC
theme.titlebar_close_button = "true"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path .. "zenburn/titlebar/close_normal.png"
theme.titlebar_close_button_focus = themes_path .. "zenburn/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path .. "zenburn/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path .. "zenburn/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path .. "zenburn/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = themes_path .. "zenburn/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "zenburn/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = themes_path .. "zenburn/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path .. "zenburn/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = themes_path .. "zenburn/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "zenburn/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = themes_path .. "zenburn/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path .. "zenburn/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "zenburn/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path .. "zenburn/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = themes_path .. "zenburn/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "zenburn/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "zenburn/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "zenburn/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = themes_path .. "zenburn/titlebar/maximized_focus_active.png"

return theme
