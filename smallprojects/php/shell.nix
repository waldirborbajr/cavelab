let pkgs = import <nixpkgs> { config.allowUnfree = true; };

in

{ pkgs ? import <nixpkgs> {} }:

let
  phpWithExtensions = pkgs.php82.withExtensions ({ enabled, all }: 
    enabled ++ (with all; [
      mysqli
      pdo_mysql
      pdo_pgsql
    ])
  );

in

pkgs.mkShell {
  buildInputs = [
    phpWithExtensions
    pkgs.neovim
    pkgs.git
    pkgs.gh
    # pkgs.mysql.client
    # pkgs.mysql.server
    pkgs.mariadb
    # pkgs.postgresql
    pkgs.php82Packages.composer
  ];

  # avoid terminal issues
  TERM = "xterm";

  # default locale
  LANG = "en_US.UTF-8";
  LANGUAGE = "en_US.UTF-8";

  shellHook = ''
    # MariaDB configuration
    export MARIADB_DATA="$PWD/.mariadb-data"
    export MARIADB_SOCKET="/tmp/mariadb-$UID.sock"
    export MARIADB_PID_FILE="/tmp/mariadb-$UID.pid"
    export MARIADB_PORT=3307

    # Initialize database if not exists
    if [ ! -d "$MARIADB_DATA" ]; then
      echo "Initializing MariaDB database..."
      mariadb-install-db \
        --datadir="$MARIADB_DATA" \
        --auth-root-authentication-method=normal \
        --skip-test-db
    fi

    # Start MariaDB server in the background
    echo "Starting MariaDB..."
    mariadbd \
      --datadir="$MARIADB_DATA" \
      --socket="$MARIADB_SOCKET" \
      --port="$MARIADB_PORT" \
      --pid-file="$MARIADB_PID_FILE" \
      --log-error="$MARIADB_DATA/mariadb.log" \
      --skip-networking=0 \
      >/dev/null 2>&1 &
      
    # Capture the process ID
    MARIADB_PID=$!
    echo $MARIADB_PID > "$MARIADB_PID_FILE"

    # Wait for socket creation
    counter=0
    while [ ! -S "$MARIADB_SOCKET" ] && [ $counter -lt 10 ]; do
      sleep 1
      counter=$((counter + 1))
    done

    if [ -S "$MARIADB_SOCKET" ]; then
      echo "MariaDB socket created at $MARIADB_SOCKET"
      export MYSQL_UNIX_PORT="$MARIADB_SOCKET"
      echo "Connect with: mariadb -u root"
    else
      echo "Failed to start MariaDB! Check logs: $MARIADB_DATA/mariadb.log"
    fi

    # Cleanup function
    function stop_mariadb() {
      echo "Stopping MariaDB (PID $MARIADB_PID)..."
      kill $MARIADB_PID 2>/dev/null || true
      rm -f "$MARIADB_PID_FILE" "$MARIADB_SOCKET"
    }

    # Register cleanup trap
    trap stop_mariadb EXIT

    # Helper message
    echo "MariaDB started on port $MARIADB_PORT"
    echo "PHP environment ready"
    echo "PHP version: $(php -v | head -n 1)"
  '';

}
