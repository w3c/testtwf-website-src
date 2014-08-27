#!/bin/sh
set -e

echo "Cloning GH repository"
echo $DESTINATION
echo $DESTINATION_BRANCH
echo https://$GIT_NAME@github.com/$USERNAME/$REPO.git
git clone https://$GIT_NAME:$GH_TOKEN@github.com/$USERNAME/$REPO.git $DESTINATION &> /dev/null
cd $DESTINATION
ls
git checkout $DESTINATION_BRANCH
echo `git rev-parse HEAD`
echo "Clone succeeded"
