function gd
	command git diff $argv
end

function gsr
	command git svn rebase $argv
end

function gsd
	command git svn dcommit $argv
end

function gco
	command git checkout $argv
end

function gst
	command git status $argv
end

function gsta
	command git stash $argv
end

function gstp
	command git stash pop $argv
end

function grh
    command git reset HEAD $argv
end

