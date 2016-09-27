function tat
	command tmux attach -t $argv
end

function tns
	command tmux new-session -s $argv
end
