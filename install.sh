#!/bin/bash

set -eux

REPONAME=.aliases
BUILDPATH=$HOME
URL=git@github.com:atomixcloud/$REPONAME.git

if [ -d $REPONAME ]; then
	mv $REPONAME $REPONAME.bkp
fi

cd $BUILDPATH

git clone $URL

cd $REPONAME
eval ./install.sh
cd $OLDPWD

exit $?
