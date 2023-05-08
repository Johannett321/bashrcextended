#!/bin/bash

# make sure the basrc file exists
if [ ! -f ".bashrc" ]; then
  echo "The file '.bashrc' does not exist in the current directory."
  exit 1
fi

# make sure .bashrcextended is installed
if ! grep -q ".bashrcextended" .bashrc; then
  echo "Bashrcextended is not installed. Installing..."
  echo "" >> .bashrc
  echo "# Source bashrcextended" >> .bashrc
  echo "if [ -f ~/.bashrcextended ]; then" >> .bashrc
  echo "  . ~/.bashrcextended" >> .bashrc
  echo "fi" >> .bashrc
  echo "Bashrcextended installed!"
fi

# download the bashrcextended file
if ! curl -s -o .bashrcextended "https://raw.githubusercontent.com/Johannett321/bashrcextended/master/.bashrcextended"; then
    echo "Error updating Bashrcextended"
    exit 1
fi

echo "Bashrcextended updated!"
source .bashrc