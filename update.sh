#!/usr/bin/env sh

nix flake update
home-manager switch --flake .#cavelab -b BKP
nix-store --gc && nix-collect-garbage -d && home-manager expire-generations -2 days
