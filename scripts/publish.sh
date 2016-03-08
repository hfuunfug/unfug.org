#!/usr/bin/env bash

RSYNC=$(which rsync)

if [ "$RSYNC" == "" ]; then
    echo "No rsync installed."
    exit 1
fi

usage() {
    cat <<EOS
    $(basename $0) [options]
        -h               | show this and exit
        -v               | be verbose
        -s <destination> | SSH server destination path (required)
        -d <dir>         | Directory to sync (required)
EOS
}

VERBOSE=0
DESTINATION=
DIR=

while getopts 'hs:d:v' opt
do
    case $opt in
        h) usage && exit 1
            ;;

        v) VERBOSE=1
            ;;

        s) DESTINATION=$OPTARG
            ;;

        d) DIR=$OPTARG
            ;;

        *) usage && exit 1
            ;;
    esac
done

if [ "$DESTINATION" == "" ]; then
    echo "No destination"
    exit 1
fi

if [ "$DIR" == "" ]; then
    echo "No directory to sync."
    exit 1
fi

putstr() {
    [[ $VERBOSE -eq 1 ]] && echo -e "[$(basename $0)]: $*"
}

putstr "Syncing $DIR/* -> $DESTINATION"
rsync -ptuvPzhr --stats -e ssh $DIR/* $DESTINATION

echo "Done."

