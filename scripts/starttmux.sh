session="ray"

tmux start-server

tmux new-session -d -s $session
tmux new-window -t $session:1 -n NovaArch -c "ssh NovaArch"

