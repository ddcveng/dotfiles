#!/usr/bin/bash

# should be run with X running
# and dwmblocks started

DELIM="|"
SPACE=" "
EMPTY="-"
LAYOUT_SRC="$HOME/.local/share/layouts.dd"

if [ ! -f $LAYOUT_SRC ]; then
    echo "Layout file not found!"
    exit 1
fi

DEFAULT=$(grep '^*' $LAYOUT_SRC | tr -d '*')
QUERY=$DEFAULT

# todo: check value of $1
if [ -z "$1" ]; then
    QUERY=$(grep -v '^ *#' $LAYOUT_SRC | tr -d '*' | dmenu -i -p "layout: ")
fi

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

exit 0
