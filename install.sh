#!/bin/bash

set -eux

REPONAME=.aliases
BUILDPATH=$HOME
URL=git@github.com:atomixcloud/$REPONAME.git

cd $BUILDPATH

if [ -d $REPONAME ]; then
	mv $REPONAME $REPONAME.bkp
fi

git clone $URL

cd $REPONAME
eval ./install.sh
cd $OLDPWD

exit $?
