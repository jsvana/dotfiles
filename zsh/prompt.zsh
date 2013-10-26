autoload colors; colors

local line_divider='${(1.$COLUMNS..-.)}'

PROMPT="$FG[011]${line_divider}
%{$fg[cyan]%}$%{$reset_color}"
