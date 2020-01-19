#cp to root folder of repository
#save current directory
#change to root repository
#git add all
#git commit time stamp + rando word + files summary + comment argument supplied if found
#git push
#cd back to current directory
GIT_ASKPASS=qgjkrrr69-GH
GIT_REPO_PATH="$HOME/slash/work-my-black-nec"
CURRENT_DIR_PATH="$PWD"
cp -bv "$1" "${GIT_REPO_PATH}/$1"
cd $GIT_REPO_PATH
git add .
git commit -a -m "`/bin/date` $1 $2"
git push origin master

cd $CURRENT_DIR_PATH
