function ems
	command emacs -q -l ~/R/pu/.emacs.lite --daemon
end

function em
	command emacsclient -nw $argv
end

function ee
	command emacs -q -l ~/R/pu/.emacs.lite $argv
end
