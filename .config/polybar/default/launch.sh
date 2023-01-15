#!/usr/bin/env bash

# Terminate already running bar instances
killall polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar base -c $(dirname $0)/config.ini &
polybar center -c $(dirname $0)/config.ini &
polybar end -c $(dirname $0)/config.ini &

if [[ $(xrandr -q | grep 'HDMI-A-0 connected') ]]; then
  polybar ext_base -c $(dirname $0)/config.ini &
  polybar ext_center -c $(dirname $0)/config.ini &
  polybar ext_end -c $(dirname $0)/config.ini &
fi
