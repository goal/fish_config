function grep
    command grep --color=auto $argv
end

function fhead
    echo "#include <$argv>" | cpp -H -o /dev/null 2>&1 | head -n1
end

function lf
    command curl http://kmochi.com:6666/ecdict/$argv
end

function nj
    command ninja $argv
end

function waf
    command /home/wyj/R/waf/waf $argv
end

function vv
    if test -f ~/bin/nvim.appimage
        command ~/bin/nvim.appimage $argv
    else
        command nvim $argv
    end
end

function iclj
    command jupyter-console --kernel=clojupyter
end

function hgv
    command python ~/bin/hgv.py
end

function hgvd
    command python ~/R/hgv/hgv.py
end

function sm
    # 需要添加ssh key先
    command luit -encoding gb2312 ssh crgold@newsmth.net
end
