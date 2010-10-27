#!/bin/bash

DOTFILES=".dotfiles"
IGNORE=( $(basename $0) . .. .git .gitignore README.markdown )

HOMEDIR=`cd ~; pwd`

cd `dirname $0`

for f in `ls`; do

    for i in ${IGNORE[@]}; do
        if [ "$f" == "$i" ]; then
            continue 2
        fi
    done

    if [[ -h "$HOMEDIR/.$f" ]]; then
        if [[ `readlink "$HOMEDIR/.$f"` == "$DOTFILES/$f" ]]; then
           #echo "File $HOMEDIR/.$f already points to $DOTFILES/$f";
           continue;
        fi
    fi

    if [[ -e "$HOMEDIR/.$f" ]]; then
        #echo -n "File exists: $HOMEDIR/.$f  Replace? [y/N] "
        read -p "File exits: $HOMEDIR/.$f  Replace? [y/N] " -n 1 ans
        if [[ ${ans} != "" ]]; then
            echo
        fi
        if [[ ${ans} != 'y' && ${ans} != 'Y' ]]; then
            continue;
        fi
        rm -rf "$HOMEDIR/.$f"
    fi

    #echo "Linking $HOMEDIR/.$f to $DOTFILES/.$f"
    ln -s "$DOTFILES/$f" "$HOMEDIR/.$f"

done
