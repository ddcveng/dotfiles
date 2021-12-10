#!/usr/bin/bash

DELIM="|"
SPACE=" "
EMPTY="-"
LAYOUT_SRC="$HOME/.local/share/layouts.dd"

QUERY=$(awk "NR>2" $LAYOUT_SRC | dmenu -i -p "layout: ")
if [ -z $QUERY ]; then
    exit 1
fi
LAYOUT=$(echo $QUERY | cut -d$DELIM -f 1)
VARIANT=$(echo $QUERY | cut -d$DELIM -f 2)
OPTION=$(echo $QUERY | cut -d$DELIM -f 3)

OPTIONS=""
if [ -z $LAYOUT ]; then
    exit 1
fi
OPTIONS=$LAYOUT
if [ ! "$VARIANT" = $EMPTY ]; then
    OPTIONS="${OPTIONS} ${VARIANT}"
fi
if [ ! "$OPTION" = $EMPTY ]; then
    OPTIONS="${OPTIONS} -option ${OPTION}"
fi

setxkbmap $OPTIONS > /dev/null
sigdwmblocks 2
