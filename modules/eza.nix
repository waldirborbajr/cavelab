{ ... }: {
  programs.eza = {
    enable = true;
    icons = true;
    enableZshIntegration = true;
  };

  home.shellAliases = {
    ls = "eza --icons --time-style=iso --git";
    l = "ls";
    ll = "ls -lgh";
    la = "ls -aa";
    lt = "ls -lgh --tree";
    lta = "lt -a";
    lla = "ll -aa";
  };
}
