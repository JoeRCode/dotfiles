#!/usr/bin/env bash
# Prints out the $PATH variable, each entry has is displayed in a new line

echo -e ${PATH//:/\\n}
