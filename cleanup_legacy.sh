#!/bin/bash

# Cleanup old symlink
if [ -L $HOME/.bash_aliases ]; then
  rm $HOME/.bash_aliases
fi
