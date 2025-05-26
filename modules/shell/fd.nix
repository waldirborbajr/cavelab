{ pkgs, ... }: {
  programs.fd = {
    enable = true;
    package = pkgs.fd;
    ignores = [ ".git" "node_modules" ];
    hidden = true;
  };
}
