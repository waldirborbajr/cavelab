{ pkgs, ... }: {
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--iglob=!.git"
      "--iglob=!node_modules"
      "--max-columns=150"
      "--max-columns-preview"
      "--glob=!.git/*"
      "--smart-case"
    ];
  };
}
