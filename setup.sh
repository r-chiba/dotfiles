#!/bin/bash

if [ $# -ne 1 ]; then
    echo "$0 cmd"
    echo "cmd:"
    echo "    test   : print files to be linked"
    echo "    link   : link the files"
    echo "    unlink : unlink the files"
    exit 1
fi

SCRIPTPATH=`realpath "$0"`
SCRIPTDIR=`dirname "$SCRIPTPATH"`
cd "$SCRIPTDIR"
DOTFILES=`find "$SCRIPTDIR" -maxdepth 1`
for file in $DOTFILES; do
    if [ $file = $SCRIPTDIR ] \
       || [ $file = $SCRIPTPATH ] \
       || [ `echo $file | grep .git` ]
    then
        continue
    fi

    fname=`basename "$file"`
    if [ $1 = "link" ]; then
        ln -v -s "$file" "$HOME/$fname"
    elif [ $1 = "unlink" ]; then
        unlink "$HOME/$fname"
        echo "[UNLINK] \"$HOME/$fname\""
    else
        echo "[TEST] \"$file\" => \"$HOME/$fname\""
    fi
done

