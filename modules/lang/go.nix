{ pkgs, config, ... }:
{

  programs.go.enable = true;

  home.packages = with pkgs; [
    # (hiPrio go_1_23)
    air
    delve
    go-outline
    go-symbols
    go-tools # staticcheck
    gocode-gomod
    godef
    gofumpt
    golangci-lint
    gomod2nix
    gomodifytags
    gopkgs
    gopls
    goreleaser
    gotests
    gotools
    iferr
    impl
    revive
    sqlc
    templ 
  ];

  # home.sessionVariables = {
  #   GOROOT = "${config.programs.go.package}/share/go";
  #   GOPATH = "${config.home.homeDirectory}/go";
  #   GOBIN = "${config.home.homeDirectory}/bin";
  # };

  # home.sessionPath = [ "${config.home.sessionVariables.GOBIN}" ];
}
