let pkgs = import <nixpkgs> { config.allowUnfree = true; };
in
with import <nixpkgs> {}; [
  fd
  ripgrep
  eza
  bat
  tmux
  htop
  stow
  yazi
  lazygit
  gh
  bottom
  neovim
]
