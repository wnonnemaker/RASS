#!/bin/bash


SESSION_MARKER="/tmp/session_marker"

if [ -n "$DISPLAY" ]; then
  if [ ! -f "$SESSION_MARKER" ]; then 
	  neofetch

	  touch "$SESSION_MARKER"
  fi
fi
