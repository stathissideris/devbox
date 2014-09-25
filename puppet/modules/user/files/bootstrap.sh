#!/bin/bash
cd /home/sideris/dotfiles
/usr/bin/rsync --exclude ".git/" --exclude ".DS_Store" --exclude ".bootstrap.sh" -av --no-perms . /home/sideris/
