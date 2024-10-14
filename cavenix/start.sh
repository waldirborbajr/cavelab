#!/usr/bin/env sh

nix run home-manager -- switch --flake .#cavelab -b BKP
