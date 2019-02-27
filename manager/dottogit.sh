#!/bin/env sh
# This script helps to automate my dotfiles:
# 1) moves the original file to git
# 2) creates a symbolic link in original place to the original (now on this git)
# 3) creates a file that contains the original target place
# 4) uploads to git

# Path for this git repo
REPO_DIR=~/dotfiles
CSVFILE=links.csv

if [ $# -lt 1 ]; then
    echo "One argument needed."
    exit
fi

# Move and create the symbolic link
TARGET=$(readlink -f $1)
target_filename=$(basename $TARGET)
target_dir=$(dirname $TARGET)
REPO_FILE=$REPO_DIR/$target_filename

echo Moving "$TARGET" to "$REPO_DIR"
mv "$TARGET" "$REPO_DIR"
echo ... DONE
echo Linking "$REPO_FILE" to "$target_dir"
ln -sv "$REPO_FILE" "$target_dir"
echo ... DONE

# Check
echo Checking if "$TARGET" links to "$REPO_FILE"
if [ "$TARGET" -ef "$REPO_FILE" ] 
then
    echo ... OK!
else
    echo ... ERROR!  
    exit -1 
fi

# Add a reference of its original location in a csv file
echo "$TARGET" > "$REPO_FILE.location"
# Check
echo Checking if "$REPO_FILE.location" really contains "$TARGET"
if [ "$(cat $REPO_FILE.location)" = "$TARGET" ]
then
    echo ... OK!
else
    echo ... ERROR!  
    exit -1 
fi

# Update to the GIT repository
current_dir=$(pwd)
echo Updating git
cd $REPO_DIR
git add $target_filename
git commit -m "dotfile added"
git push origin master
cd $current_dir


