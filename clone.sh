echo "Cloning GH repository" &&
git clone https://$GIT_NAME:$GH_TOKEN@github.com/$USERNAME/$REPO.git $DESTINATION &> /dev/null &&
cd $DESTINATION &&
git checkout $DESTINATION_BRANCH &&
echo `git rev-parse HEAD` &&
ls &&
echo "Clone succeeded"
