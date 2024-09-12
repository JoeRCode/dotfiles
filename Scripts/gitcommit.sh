#!/bin/bash

# A Script to read commit msg and use git to commit with msg

read -p "Enter a commitmessage: " msg

git commit -m "$msg"
