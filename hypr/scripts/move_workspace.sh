#!/usr/bin/env bash

# uso: move_workspace.sh left | right | 0 | 1

case "$1" in
  left)
    target=0   # eDP-1
    ;;
  right)
    target=1   # HDMI-A-2
    ;;
  0|1)
    target="$1"
    ;;
  *)
    exit 1
    ;;
esac

# pega o ID da workspace atual (modo compatível com versões antigas)
ws=$(hyprctl activeworkspace | grep -i "ID" | sed 's/[^0-9]*\([0-9]\+\).*/\1/')

[ -n "$ws" ] && hyprctl dispatch moveworkspacetomonitor "$ws" "$target"
