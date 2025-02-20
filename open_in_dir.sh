#!/bin/bash

WIN_ID=$(xdotool getwindowfocus)
PID=$(xdotool getwindowpid "$WIN_ID")
SHELLPID=$(pgrep -P "$PID")

DIR=$(readlink -e /proc/$SHELLPID/cwd)

[ -d "$DIR" ] && cd "$DIR" && st
