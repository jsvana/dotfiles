autoload colors; colors

local line_divider='${(l.$COLUMNS..-.)}'

PROMPT="%(?/%{$reset_color%}/%{$fg[red]%})%(!.#.:)%{$reset_color%} "
