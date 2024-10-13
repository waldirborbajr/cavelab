let pkgs = import <nixpkgs> { config.allowUnfree = true; };

in

{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [ 
    nvim
    gum
    git
    gh
    kind
    kubectl
    yq-go
    google-cloud-sdk
    awscli2
    eksctl
    azure-cli
  ];

  # avoid terminal issues
  TERM = "xterm";

  # default locale
  LANG = "en_US.UTF-8";
  LANGUAGE = "en_US.UTF-8";

  shellHook = ''
    alias l='ls -la'
    alias ll='ls -la'

    # PS1="$ "

    echo ""
    echo "That's all folks."
    echo ""
    echo "To start a VueJS project type"
    echo ""
    echo "pnpm create vite your-vue-app --template vue"
  '';
}
