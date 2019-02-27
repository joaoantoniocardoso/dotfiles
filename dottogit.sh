#!/bin/env sh
# This script helps to automate my dotfiles:
# 1) moves the original file to git
# 2) creates a symbolic link in original place to the original (now on this git)
# 3) uploads to git

# Path for this git repo
REPO_DIR=~/dotfiles

if [ $# -lt 1 ]; then
    echo "One argument needed."
    exit
fi

TARGET=$(readlink -f $1)
target_filename=$(basename $TARGET)
target_dir=$(dirname $TARGET)

echo Moving $TARGET to $REPO_DIR
mv $TARGET $REPO_DIR
echo ... DONE
echo Linking $REPO_DIR/$target_filename to $target_dir
ln -sv $REPO_DIR/$target_filename $target_dir
echo ... DONE

current_dir=$(pwd)
echo Updating git
cd $REPO_DIR
git add $target_filename
git commit -m "dotfile added"
git push origin master
cd $current_dir

