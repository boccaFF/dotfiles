#!/bin/bash

#TODO: evaluate a makefile or stow for this

#https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


#TODO: loop over files instead of series of  multiple ifs
if [ -e $HOME/.vimrc ]
then
  cp $HOME/.vimrc  $HOME/.vimrc.bak --backup=t
  rm $HOME/.vimrc
  echo 'Backup file created for older version of .vimrc'
fi

if [ -e $HOME/.tmux.conf ]
then
  cp $HOME/.tmux.conf $HOME/.tmux.conf.bak --backup=t
  rm $HOME/.tmux.conf
  echo 'Backup file created for older version of .tmux.conf'
fi

ln -s $DIR/vimrc $HOME/.vimrc
ln -s $DIR/tmux.conf $HOME/.tmux.conf


