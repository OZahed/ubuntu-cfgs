#! /bin/bash

[ -Z $1 ] && echo "please enter the username for git"
[ -Z $2 ] && echo "please enter the email for git"


git config --global user.name $1
git config --global user.email $2


which cargo || exit 127
cargo install git-delta

git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global delta.line-numbers true
git config --global delta.side-by-side true
git config --global merge.conflictStyle zdiff3
