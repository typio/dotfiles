local wezterm = require("wezterm")

return {
    color_scheme = "kanagawabones",

    font = wezterm.font("Cascadia Code PL", { weight = "DemiBold" }),
    font_size = 14,
    window_background_opacity = 0.85,

    enable_tab_bar = false,

    window_frame = {
        font = wezterm.font { family = 'Cascadia Code PL', weight = 'Black' },
        font_size = 13.5,
    },

    colors = {
        tab_bar = {
            inactive_tab_edge = '#575757',
            active_tab = {
                bg_color = '#16161D',
                fg_color = '#C8C093',

                underline = 'None',
                italic = false,
                strikethrough = false,
            },

            inactive_tab = {
                bg_color = '#1F1F28',
                fg_color = '#DCD7BA',
            },
        },
    },


    enable_scroll_bar = true,
    window_decorations = "RESIZE",

}
