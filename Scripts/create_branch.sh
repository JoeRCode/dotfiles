#!/bin/bash

# Check if exactly two arguments are provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <TICKETNUMBER> <STRING>"
  exit 1
fi

TICKETNUMBER=$1
BRANCH_NAME=$2

# Replace spaces in the branch name string with hyphens and make it lowercase
BRANCH_NAME_SANITIZED=$(echo "$BRANCH_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

# Construct and execute the git command
FULL_BRANCH_NAME="feature/FD-$TICKETNUMBER/$BRANCH_NAME_SANITIZED"
echo "Creating and switching to branch: $FULL_BRANCH_NAME"

git checkout -b "$FULL_BRANCH_NAME"
