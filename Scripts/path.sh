#!/usr/bin/env bash
# Prints out the $PATH variable,so each entry is displayed on a new line

echo -e ${PATH//:/\\n}
