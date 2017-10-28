#!/bin/bash

#TODO: evaluate a makefile or stow for this

#https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

LINKS="vimrc  tmux.conf python_calc.py"

for link in $LINKS; do
  #echo $link
  if [ -e $HOME/".$link" ]
  then
    echo ".$link"
    cp $HOME/.$link $HOME/.$link.bak --backup=t
    rm $HOME/.$link
    echo 'Backup file created for older version of '$vimrc
  fi

  ln -s $DIR/$link $HOME/".$link"

done

#for link in $LINKS; do
  #if [ -e $HOME/.$link]
  #then
    #echo .$link
    #cp $HOME/.$link $HOME/.$link.bak --backup=t
    #rm $HOME/.$link
    #echo 'Backup file created for older version of '$vimrc
  #fi
#done
