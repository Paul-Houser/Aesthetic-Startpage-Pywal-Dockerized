#!/bin/bash

cache_dir=$HOME/.cache/Aesthetic-Startpage

# check if .cache path exists
if [ ! -d "$HOME/.cache" ]; then
  echo "The directory '~/.cache' does not exist."
  exit
fi


# create directory structure in .cache
if [ ! -d "$cache_dir" ]; then
  echo "Creating '$cache_dir'..."
  mkdir $cache_dir

  echo "Symlinking index.html..."
  ln -s $(pwd)/index.html $cache_dir/index.html

  echo "Symlinking themes..."
  ln -s $(pwd)/themes $cache_dir/themes

  echo "Symlinking '$cache_dir/images'..."
  ln -s $(pwd)/images $cache_dir/images

  # check if pywal colors exist
  if [ -f "$HOME/.cache/wal/colors.css" ]; then
    ln -s $HOME/.cache/wal/colors.css $cache_dir/pywal_colors.css
  else
    echo "Pywal colors don't exist in the expected location. Pywal theme may not work properly."
  fi
fi

FILEPATH=$(readlink -f "docker/data/default.conf")
ln -s $FILEPATH $cache_dir/default.conf
