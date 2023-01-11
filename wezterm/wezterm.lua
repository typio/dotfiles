local wezterm = require("wezterm")

return {
  color_scheme = "kanagawabones",

  font = wezterm.font("Cascadia Code PL", { weight = "DemiBold" }),
  font_size = 14,
  window_background_opacity = 0.9,

  enable_tab_bar = false,
  enable_scroll_bar = true,
  window_decorations = "RESIZE",
}
