#!/bin/sh
UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")
echo $UPSTRAM;
echo $LOCAL;
echo $REMOTE;
echo $BASE;
if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
elif [ $REMOTE = $BASE ]; then
    echo "Need to push"
else
    echo "Diverged"
fi
