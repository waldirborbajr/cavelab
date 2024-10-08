{config, ...}: {
  home.packages = with pkgs; [
    (hiPrio  go_1_23)
    gopls
    gotools
    air
  ];
  programs.go.enable = true;
  home.sessionVariables = {
    GOPATH = "${config.xdg.dataHome}/go";
    GOBIN = "${config.home.sessionVariables.GOPATH}/bin";
  };
  home.sessionPath = [
    "${config.home.sessionVariables.GOBIN}"
  ];
}
