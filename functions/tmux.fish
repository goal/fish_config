function tat
	command tmux attach -t $argv
end

function tns
    if not tmuxp load $argv
        command tmux new-session -s $argv
    end
end
