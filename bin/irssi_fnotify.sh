#!/bin/sh

ssh hephaestus "touch .irssi/fnotify ; tail -f .irssi/fnotify " | \
while read heading message; do
  growlnotify -s -t "${heading}" -m "${message}"
done
