let
  # Pin nixpkgs to a specific version for reproducibility
  pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/tags/23.11.tar.gz") {
    config.allowUnfree = true;
  };
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    # Use consistent node.js ecosystem
    nodejs_21  # Fixed attribute name for Node 21
    
    nodePackages.typescript-language-server
    nodePackages_latest.pnpm
    nodePackages_latest.vue-cli

    # Development essentials
    git
    curl
    
    # Additional tools
    tree
    jq
    nodePackages.prettier
  ];

  # Environment variables
  TERM = "xterm";
  LANG = "C.UTF-8";      # More universally available
  LC_ALL = "C.UTF-8";    # Ensure consistent locale
  NODE_ENV = "development";

  shellHook = ''
    # Set up project-local node_modules
    export PATH="$PWD/node_modules/.bin:$PATH"
    export NODE_PATH="$PWD/node_modules:$NODE_PATH"

    # Create basic .env file if missing
    if [ ! -f .env ]; then
      echo "VITE_APP_NAME=My Vue App" > .env
      echo "Created .env file"
    fi

    # Improved aliases
    alias setupvue='pnpm add -D tailwindcss postcss autoprefixer @tailwindcss/forms && \
      npx tailwindcss init -p && \
      pnpm add vue-router@4 vuex@next && \
      pnpm install'

    # Unified package manager commands
    alias nr='pnpm dev'
    alias nd='pnpm dev'
    alias nb='pnpm build'
    alias nl='pnpm lint'
    alias nt='pnpm test'

    # Quality of life improvements
    alias ll='exa -la --group-directories-first --git'
    alias tree='exa --tree --level=2'
    alias code='codium .'  # Or 'code .' if using VSCode

    # Shell configuration
    export HISTSIZE=10000
    export HISTFILESIZE=50000
    export HISTCONTROL=ignoreboth

    # Project validation
    function create-vue-app() {
      if [ -z "$1" ]; then
        echo "Usage: create-vue-app <project-name>"
        return 1
      fi
      pnpm create vite "$1" --template vue-ts
    }

    # Welcome message
    echo "🛠️ Vue.js Development Environment Ready"
    echo "📦 Node $(node -v) | PNPM $(pnpm -v)"
    echo ""
    echo "To create a new project:"
    echo "  create-vue-app your-project-name"
    echo ""
    echo "Common commands:"
    echo "  nd - Start dev server"
    echo "  nb - Build project"
    echo "  nl - Run linter"
    echo "  nt - Run tests"
  '';
}
