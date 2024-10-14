#!/usr/bin/env sh

git add . && git commit -m "WIP" && git push

home-manager switch --impure --flake .#cavelab -b hm-backup-`date +%Y.%m.%d.%H.%M.%S`
