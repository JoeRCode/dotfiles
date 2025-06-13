#!/bin/bash

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    echo "Error: At least one parameter is required."
    echo "Usage: $0 param1 [param2]"
    exit 1
fi

# Base URL
BASE_URL="https://jira.hornbach.int/browse"

# Construct URL based on arguments
if [ "$1" = "me" ]; then
    URL="https://jira.hornbach.int/secure/Dashboard.jspa"
elif [ "$1" = "c" ]; then
    # Get the current Git branch name
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
    URL="${BASE_URL}/FD-${TICKET_NUMBER}"
elif [ $# -eq 1 ]; then
    URL="${BASE_URL}/FD-${1}"
else
    URL="${BASE_URL}/${2}-${1}"
fi

# Open the URL in the default browser
# Using xdg-open for Linux, open for macOS, or start for Windows (Git Bash)
if command -v xdg-open >/dev/null 2>&1; then
    xdg-open "$URL"
elif command -v open >/dev/null 2>&1; then
    open "$URL"
elif command -v start >/dev/null 2>&1; then
    start "$URL"
else
    echo "Error: No suitable command found to open the browser."
    exit 1
fi

exit 0
