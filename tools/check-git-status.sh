#!/bin/sh

if [ -z "$(git status --porcelain)" ]; then
    echo "No git changes."
else
    echo "Git changes detected. Please review log and commit changes."
fi