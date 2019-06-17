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

function gpsh
    if not git push
        set branch (git branch | grep "*" | awk '{print $2}')
        command git push --set-upstream origin $branch
    end
end

function ggc
    set branch_pattern $argv[1]
    if test -n "$branch_pattern"
        set target_branch (git branch -a | grep "remotes/origin/" | grep -v HEAD | awk /$branch_pattern/'{sub("remotes/origin/", "", $1); print $1}' | head -n 1)
        if test -n "$target_branch"
            set_color yellow
            echo "Checkout branch: $target_branch ..."
            set_color normal

            git checkout $target_branch
        end
    end
end

function nmr
    set branch (git branch | grep "*" | awk '{print $2}')
    set __nmr_ip (echo $SSH_CLIENT | awk '{print $1}')
    http -v http://$__nmr_ip:3030/openurl url="http://gitlab.rd.175game.com/q1-server/q1-server-logic/merge_requests/new?merge_request%5Bsource_branch%5D=$branch"
end
