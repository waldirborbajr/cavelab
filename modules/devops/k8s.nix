{ pkgs, ... }:

{

  home = {
    packages = with pkgs; [
      k3d
      kubectl
      # kubectx
      # kubie
      # k3s
      # k9s
      # kind
      # minikube
    ];
  };

}
