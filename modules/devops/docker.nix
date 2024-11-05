{ pkgs, ... }:

{

  home = {
    packages = with pkgs; [
      lazydocker
      docker
      docker-compose
      docker-credential-gcr
      docker-credential-helpers
    ];
  };

}
