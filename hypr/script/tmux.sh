#!/usr/bin/env bash

function tmux_sessions() {
	tmux list-session -F '#S'
}

TMUX_SESSION=$( (
	tmux_sessions
	echo new
) | rofi -dmenu -p -theme ~/mygithub/conf/rofi/theme/yaooc.rasi "session")

if [[ x"new" = x"${TMUX_SESSION}" ]]; then
	kitty -1 -e tmux new-session &
elif [[ -z "${TMUX_SESSION}" ]]; then
	echo "Cancel"
else
	kitty -1 -e tmux attach -t "${TMUX_SESSION}" &
fi


