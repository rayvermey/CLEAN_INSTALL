#!/bin/sh
tmux new-session
tmux new-window -n rTorrent -d 'rtorrent' 
tmux new-window -n Ranger 'ranger'
tmux new-window -n Shell 'zsh'
tmux -2 attach-session -d
