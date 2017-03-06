synclient TouchPadOff=1

srandrd "$HOME/bin/xrandr-mode"

pulseaudio --start

exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
