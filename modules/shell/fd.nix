{
  programs.fd = {
    enable = true;
    package = pkgs.fd;
    ignores = [ ".git" "node_modules" ".bak"];
    hidden = true;
  };
}
