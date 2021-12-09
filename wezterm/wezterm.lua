local wezterm = require 'wezterm';
return {
    default_prog = {
        "/usr/bin/zsh",
        "-l"
    },
    font = wezterm.font("FantasqueSansMono-Regular"),
    font_size = 14,
    harfbuzz_features = {
        "calt=1",
        "clig=1",
        "liga=1"
    },
    color_scheme = "Molokai",
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    window_padding = {
        left = 5,
        right = 5,
        top = 2,
        bottom = 2
    },
    window_background_opacity = 0.98,
    scrollback_lines = 5000,
    enable_scroll_bar = true,
    warn_about_missing_glyphs = false
}
