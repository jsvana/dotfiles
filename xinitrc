if ! pgrep -x xscreensaver; then
    xscreensaver -nosplash &
fi

synclient TouchPadOff=1

exec i3
