WORKSPACE=$(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1) + 1)) 
echo $WORKSPACE
i3-msg workspace $WORKSPACE "NOVA" 
teams &

