#!/bin/bash
cd $(pwd)
git add -A
git commit -S -m "$1 at $(date +"%H:%M") of $(date +"%d-%m-%Y")"
git push -u origin $(git rev-parse --abbrev-ref HEAD)
