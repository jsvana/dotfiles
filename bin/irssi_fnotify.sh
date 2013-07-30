#!/bin/sh

ssh jsvana@jsvana.io -p 49621 -o PermitLocalCommand=no  \
  "touch .irssi/fnotify ; tail -f .irssi/fnotify " |  \
while read heading message; do                      \
  growlnotify -s -t "${heading}" -m "${message}";      \
done
