#!/usr/bin/env bash

## If alacritty.yml does not exist, raise an alert
[[ ! -f ~/.config/alacritty/alacritty.yml ]] &&
	echo "alacritty.yml does not exist" && exit 0

## Fetch opacity from alacritty.yml
opacity=$(awk '$1 == "opacity:" {print $2; exit}' \
	~/.config/alacritty/alacritty.yml)

## Assign toggle opacity value
case $opacity in
1)
	toggle_opacity=0.93
	;;
*)
	toggle_opacity=1
	;;
esac

echo $opacity

## Replace opacity value in alacritty.yml
sed -i -- "s/opacity: $opacity/opacity: $toggle_opacity/" \
	~/.config/alacritty/alacritty.yml
