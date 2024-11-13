#!/bin/bash
# Modeline {
#	 vi: foldmarker={,} foldmethod=marker foldlevel=0 tabstop=4 filetype=sh
# }

CIRCUIT="circuit"

tmux has-session -t $CIRCUIT 2>/dev/null
if [ $? != 0 ]; then
    # create my session {
	tmux new-session -d -s $CIRCUIT -n "project"

	tmux send-keys -t $CIRCUIT:project "cd ~/project/src/" C-m
	tmux send-keys -t $CIRCUIT:project "vim ." C-m
    tmux split-window -t $CIRCUIT:project -v

	tmux new-window -t $CIRCUIT -n "build"
	tmux send-keys -t $CIRCUIT:build "cd ~/project/build/" C-m
	tmux send-keys -t $CIRCUIT:build "ls ." C-m
    tmux split-window -t $CIRCUIT:build -h

	tmux select-window -t $CIRCUIT:project
    # }
fi

tmux attach-session -t $CIRCUIT
