set -x PATH $PATH /usr/sbin /sbin /usr/local/sbin /usr/local/bin ~/bin ~/.local/bin /home/linuxbrew/.linuxbrew/bin
#set -x LD_LIBRARY_PATH /home/wyj/w/lib

#set -x GOROOT /usr/local/opt/go/libexec
#set -x GOPATH ~/code

# fuxor git to non-interactively merge commits
set -x GIT_MERGE_AUTOEDIT no

# Set where to install casks
#set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"

# Setup terminal, and turn on colors
set -x TERM xterm-256color
#set -xU LS_COLORS "di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34:su=0:sg=0:tw=0:ow=0:"

# Enable color in grep
set -x GREP_COLOR '3;33'

set -x LESS '--ignore-case --raw-control-chars'
set -x PAGER 'less'
set -x EDITOR 'nvim'

set -x LANG zh_CN.UTF-8
set -x LC_CTYPE "zh_CN.UTF-8"
set -x LC_MESSAGES "en_US.UTF-8"
set -x LC_COLLATE C

source ~/.config/fish/functions/emacs.fish
source ~/.config/fish/functions/git.fish
source ~/.config/fish/functions/tmux.fish
source ~/.config/fish/functions/util.fish

# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# # Status Chars
# set __fish_git_prompt_char_dirtystate '±'
# set __fish_git_prompt_char_stagedstate '→'
# set __fish_git_prompt_char_stashstate '←'
# set __fish_git_prompt_char_upstream_ahead '↑'
# set __fish_git_prompt_char_upstream_behind '↓'

function fish_prompt
    set_color brblue
    printf '%s ' (prompt_hostname)
    set_color $fish_color_cwd
    printf '%s' (prompt_pwd)
    set_color normal
    printf '%s' (__fish_git_prompt)
    printf '%s ' (__fish_hg_prompt)
    set_color normal
end

function fish_right_prompt
    set __last_status $status
    set_color brblue
    jobs | tail | awk '{print $1":"$6}' ORS=',' | sed 's/\(.*\).$/[\1]/'
    if test $__last_status -ne 0
        set_color brred
        printf ' %d' $__last_status
        set_color normal
    end
    set_color normal
end

thefuck --alias | source

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end
