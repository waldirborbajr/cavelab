{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    starship.enable = lib.mkEnableOption "Enable starship module";
  };
  config = lib.mkIf config.starship.enable {
    programs.starship =
      let
        mocha = import ./starship/mocha.nix;
        oxocarbon = import ./starship/oxocarbon.nix;
        catppuccinPowerline = builtins.fromTOML (builtins.readFile ./starship/catppuccin-powerline.toml);
        pure = builtins.fromTOML (builtins.readFile ./starship/pure-preset.toml);
        tuxdot = import ./starship/tuxdot.nix;
      in
      {
        enable = true;
        settings = catppuccinPowerline;
      };
  };
}
