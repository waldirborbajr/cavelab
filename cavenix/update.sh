#!/usr/bin/env sh

nix flake update
home-manager switch --flake .#cavelab -b BKP

