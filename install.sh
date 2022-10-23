#!/bin/bash

CONFIG_DIR=$HOME/.tmp
SRC_DIR=$(pwd)

WMS=(i3 bspwm hyprland)
HOME_CONFIGS=(.profile)
XDG_CONFIGS=(alacritty bin dunst foot lf nvim picom polybar rofi \
	sxhkd tmux waybar zsh)

select i in ${WMS[@]}
do
	case $i in
		i3 | bspwm)
			echo "$i selected"
			[ -f "$HOME/.xinitrc" ] && mv $HOME/.xinitrc $HOME/.xinitrc.bak
			ln -s $SRC_DIR/.xinitrc $HOME/.xinitrc
			[ -d "$CONFIG_DIR/$i" ] && mv $CONFIG_DIR/$i $CONFIG_DIR/$i.bak
			ln -s $SRC_DIR/$i $CONFIG_DIR/$i
			break
			;;
		hyprland)
			echo "hyprland selected"
			[ -d "$CONFIG_DIR/hypr" ] && mv $CONFIG_DIR/hypr $CONFIG_DIR/hypr.bak
			ln -s $SRC_DIR/hypr $CONFIG_DIR/hypr
			break
			;;
		*)
			echo "invalid option"
			;;
	esac
done

for i in ${HOME_CONFIGS[@]}
do
	[ -f "$HOME/$i" ] && mv "$HOME/$i" "$HOME/$i.bak"
	ln -s "$SRC_DIR/$i" "$HOME/$i"
done

for i in ${XDG_CONFIGS[@]}
do
	[ -d "$CONFIG_DIR/$i" ] && mv "$CONFIG_DIR/$i" "$CONFIG_DIR/$i.bak"
	ln -s "$SRC_DIR/$i" "$CONFIG_DIR/$i"
done
