{pkgs, ...}: {
  home.packages = with pkgs; [
    cargo
    rust-analyzer
    rustfmt
    # rustup
    sccache
    mdbook
    cargo-watch
    cargo-msrv
  ];
  home.sessionVariables = {
    RUSTC_WRAPPER = "sccache";
  };
  home.sessionPath = [
    "$HOME/.cargo/bin"
  ];
}
