#!/bin/bash

# create a note file (.md) with a template

# functions

# function to prompt the user for a filename
get_filename() {
  read -p "Enter a filename: " filename
  echo "$filename"
}

# function to create and open a file in the specified directory
open_file() {

  # Get the current date
  day="$(date -I)"

  # create unique identifier and links section
  timestamp="$(date +"%F_%T")"

  # Cd into the directory
  cd "$1" || exit

  # Check if file is already existing
  if [[ ! -f "$1/$filename-$day.md" ]]; then
    # Create the file in the specified directory
    touch "$1/$filename-$day.md"

    # format the file
    {
      echo "# $filename"
      echo -en "\n"
      echo -en "\n"
      echo -en "\n"
      echo "Links:"
      echo -en "\n"
      echo "$timestamp"
    } >>"$1/$filename-$day.md"
  fi

  # Open the file in Neovim
  nvim '+ normal ggzzi' "$1/$filename-$day.md"
}

### Script Start ###

# Prompt the user if no filename is provided
if [[ $# -eq 0 ]]; then
  filename=$(get_filename)
fi

# if more than one argument is given, print error message and stop script
if [[ $# -gt 1 ]]; then
  echo "Please provide only one filename separated by dashes, without .md extension."
  echo "Example: zet my-new-note"
  exit 1
fi

# set filename to the argument given to the script
if [[ $# -eq 1 ]]; then
  filename=$1
fi

# call the function with the directory as parameter
open_file "$HOME/Notes/"
