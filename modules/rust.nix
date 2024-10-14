{
  pkgs,
  config,
  lib,
  ...
}: {
  home = {
    packages = with pkgs; [
      # rustup
      clang
      bacon
      cargo
      cargo-asm
      cargo-audit
      cargo-cache
      cargo-deny
      cargo-expand
      cargo-flamegraph
      cargo-fuzz
      cargo-hack
      cargo-insta
      cargo-license
      cargo-make
      cargo-msrv
      cargo-nextest
      cargo-outdated
      cargo-semver-checks
      cargo-supply-chain
      cargo-sweep
      cargo-udeps
      cargo-vet
      cargo-watch
      clippy
      mdbook
      openssl
      pkg-config
      rust-analyzer
      rustc
      rustfilt
      rustfmt
      sccache
      taplo # toml
      udev
      wasm-bindgen-cli
    ] ++ lib.lists.optionals pkgs.stdenv.isLinux (with pkgs; [
      # binutils now conflicts with clang as well, turning this off for now...
      # binutils # For some reason conflicts on darwin
      clang # Provides `cc` for any *-sys crates
      # Common C tools
      cmake
    ]);

    sessionVariables = {
      CARGO_HOME = "${config.xdg.dataHome}/.cargo";
      CARGO_BIN = "${CARGO_HOME}/bin
      RUSTC_WRAPPER = "sccache";
      PKG_CONFIG_PATH = "${pkgs.systemd.dev}/lib/pkgconfig:$PKG_CONFIG_PATH";
      RUSTUP_HOME = "${config.xdg.dataHome}/.rustup";
      CARGO_HOME = "${config.xdg.dataHome}/.cargo";
      PATH = "$CARGO_HOME/bin:$PATH";
      RUST_LOG = "debug";
      RUST_BACKTRACE = 1;
    };
  };
}
