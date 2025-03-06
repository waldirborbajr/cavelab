{ config, pkgs, ...}:
{
  fonts.fontconfig.enable = true; # don't forget fc-cache -f

  home.packages = with pkgs; [
    font-awesome # awesome fonts
    # iconTheme.package
    material-design-icons # fonts with glyphs
    nerd-fonts.fira-code
    nerd-fonts.hack
    nerd-fonts.inconsolata
    nerd-fonts.jetbrains-mono
    nerd-fonts.meslo-lg
    nerd-fonts.ubuntu-mono
    powerline-fonts
  ];
}
