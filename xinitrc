setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape'
setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape;Control_L=Escape;Control_R=Escape'

feh --bg-scale ~/wallpapers --randomize

picom -bcCGfF -o 0.38 -O 200 -I 200 -t 0 -l 0 -r 3 -D2 -m 0.88

exec i3
