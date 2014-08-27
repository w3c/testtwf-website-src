echo "Cloning GH repository" &&
echo $DESTINATION &&
git clone https://$GIT_NAME:$GH_TOKEN@github.com/$USERNAME/$REPO.git $DESTINATION &> /dev/null &&
cd $DESTINATION &&
ls &&
git checkout $DESTINATION_BRANCH &&
echo `git rev-parse HEAD` &&
echo "Clone succeeded"
