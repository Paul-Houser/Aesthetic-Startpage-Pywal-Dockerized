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

  echo "Creating index.html..."
  cp $(pwd)/index.html $cache_dir/index.html

  echo "Symlinking themes..."
  ln -s $(pwd)/themes $cache_dir/themes

  echo "Creating '$cache_dir/styles'..."
  mkdir "$cache_dir/styles"
  cp ./themes/blue/style.css $cache_dir/styles/style.css

  echo "Creating '$cache_dir/images'..."
  mkdir "$cache_dir/images"
  cp ./themes/minimal/images/gif.gif $cache_dir/images/gif.gif
fi

FILEPATH=$(readlink -f "docker/data/default.conf")
ln -s $FILEPATH $cache_dir/default.conf
