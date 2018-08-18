#!/bin/sh

killall polybar 2> /dev/null
mon="DP-2"

env MONITOR=$mon polybar topbar 2> /dev/null &

