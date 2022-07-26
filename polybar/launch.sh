#!/bin/sh

# terminate already running bars
killall -q polybar

# wait for processes to be killed
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# launch bars
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload main &
done
