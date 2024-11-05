{ pkgs, ... }:

{

  home = {
    packages = with pkgs; [
      lazydocker
      # docker
      docker-client
      # docker-compose
      # docker-credential-gcr
      # docker-credential-helpers
    ];
  };

}
