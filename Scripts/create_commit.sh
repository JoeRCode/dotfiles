#!/bin/bash

# Check if exactly two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <TYPE> <MESSAGE>"
    exit 1
fi

TYPE=$1
MESSAGE=$2

# Get the current branch name
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
if [ $? -ne 0 ]; then
    echo "Error: Not in a Git repository or Git command failed."
    exit 1
fi

# Extract ticket number from branch name (e.g., feature/FD-12345/somethingelse -> 12345)
TICKET_NUMBER=$(echo "$BRANCH_NAME" | grep -o 'FD-[0-9]\+' | cut -d'-' -f2)
if [ -z "$TICKET_NUMBER" ]; then
    echo "Error: Could not extract ticket number from branch name '$BRANCH_NAME'."
    exit 1
fi

# Construct and run the commit message
COMMIT_MESSAGE="$TYPE: [FD-$TICKET_NUMBER] $MESSAGE"
git commit -m "$COMMIT_MESSAGE"
