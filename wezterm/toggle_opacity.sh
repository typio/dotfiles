#!/usr/bin/env bash

## If wezterm.lua does not exist, raise an alert
[[ ! -f ~/.config/wezterm/wezterm.lua ]] &&
	echo "wezterm.lua does not exist" && exit 0

## Fetch opacity from wezterm.lua
opacity=$(grep "window_background_opacity" ~/.config/wezterm/wezterm.lua |
	awk '{print $3}' | cut -d',' -f1)

echo $opacity

## Assign toggle opacity value
case $opacity in
1)
	toggle_opacity=0.93
	;;
*)
	toggle_opacity=1
	;;
esac

## Replace opacity value in wezterm.lua
sed -i -- "s/opacity = $opacity/opacity = $toggle_opacity/" \
	~/.config/wezterm/wezterm.lua
