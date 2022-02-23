#!/bin/bash

set -e

#if [ "$GITHUB_ACCESSTOKEN" == "" ]; then
#	read -p "Enter GitHub access token: " GITHUB_ACCESSTOKEN
#fi

BUILDPATH=$PREFIX/tmp
HOST=https://$GITHUB_ACCESSTOKEN@github.com

#URL=$HOST/atomixcloud/rcupdate.git
URL=git@github.com:atomixcloud/dotman.git

NAME=$(basename $URL)
TIME=$(date +"%Y%m%d%H%M%S")
BRANCH=$BUILDPATH/$NAME.$TIME

echo "Installing dotfiles ..."
git clone $URL $BRANCH

cd $BRANCH
eval ./rcupdate.sh
cd $OLDPWD
rm -rf $BRANCH

exit $?
