#!/usr/bin/env sh

nix-store --gc && nix-collect-garbage -d && home-manager expire-generations -2 days
