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
