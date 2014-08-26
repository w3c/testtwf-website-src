echo "Cloning GH repository"
git clone https://$GIT_NAME:$GH_TOKEN@github.com/$USERNAME/$REPO.git $DESTINATION &> /dev/null && echo "Clone succeeded"

