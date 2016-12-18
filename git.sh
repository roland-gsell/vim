#!/bin/bash

tmux has-session -t Git
if [[ $? != 0 ]]
then
    tmux detach
    tmux new-session -s Git -n Projekte -d
    tmux split-window -v -p 50 -t Git
    tmux send-keys -t Git:1.1 'cd /home/roland/vim' C-m
    tmux send-keys -t Git:1.1 '# git pull' C-m
    tmux send-keys -t Git:1.2 'cd /home/roland/Dokumente/siedl/vim' C-m
    tmux send-keys -t Git:1.2 '# git pull' C-m
    tmux new-window -n Bash -t Git
    tmux send-keys -t Git:2.1 '# Bash' C-m
    tmux selectw -t 1
fi
tmux -2 attach -t Git
