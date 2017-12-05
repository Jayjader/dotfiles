#! /bin/bash
laptop=eDP1
extern=HDMI1

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$laptop" --auto
else
    xrandr --output "$laptop" --primary --auto --output "$extern" --auto --left-of "$laptop"
fi

~/.fehbg &
