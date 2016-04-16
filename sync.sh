#! /bin/bash

FLAGS="rlptv"
export RSYNC_PASSWORD="password"

case "$1" in
  pull)
    PATH="rsync://root@mynas.local/me/SUBDIR/ /home/me/SUBDIR/"
    ;;
  push)
    PATH="/home/me/SUBDIR/ rsync://root@mynas.local/me/SUBDIR/"
    ;;
  *)
    echo $"Usage: $0 {push|pull} [dry]"
    exit 1
esac

if [ "$2" == "dry" ]
then
  FLAGS="${FLAGS}n"
fi


CMD="/usr/bin/rsync -$FLAGS --delete --exclude='._*' --exclude='.AppleDouble' --exclude='.DS_Store'"

for subdir in Documents Music Pictures Videos
do
  debug="$CMD ${PATH//SUBDIR/$subdir}"
  echo $debug
  eval $debug
done

debug="$CMD \
  --exclude='build' \
  --exclude='.DS_Store' \
  --exclude='node_modules' \
  --exclude='.svn' \
  --exclude='.vagrant' \
  --exclude='vendor' \
  ${PATH//SUBDIR/workspace}"
echo $debug
eval $debug
