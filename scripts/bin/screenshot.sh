#!/bin/sh -e

SCLOC="$HOME/pics/screenshots"

sel=$(slop -f "-i %i -g %g")
if [ -z "$1" ]
then
    shotgun $sel "${SCLOC}/sc-$(date +"%s").png"
else
    shotgun $sel "$1"
fi
