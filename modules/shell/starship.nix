{config, ...}: 
let
  # TODO: come back and change this a bit
  ss = symbol: style: {
    inherit symbol;
    format = "[$symbol ](${style})";
  };
in
{

  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      character = {
        success_symbol = "[›](bold green)";
        error_symbol = "[›](bold red)";
        vimcmd_symbol = "[λ](green)";
      };

      # git_status = {
      #   deleted = "✗";
      #   modified = "✶";
      #   staged = "✓";
      #   stashed = "≡";
      # };
      git_branch = {
        symbol = "󰘬 ";
        format = "[$symbol $branch]($style) ";
        truncation_length = 4;
        truncation_symbol = "…/";
        style = "purple";
      };
      git_status = {
        format = "[$all_status$ahead_behind]($style) ";
        style = "bold green";
        conflicted = "=";
        up_to_date = "󰄬 ";
        untracked = "? ";
        ahead = "⇡\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        behind = "⇣\${count}";
        stashed = "󰏗 ";
        modified = "M ";
        staged = "[++\\($count\\)](green)";
        renamed = " ";
        deleted = " ";
        disabled = true;
      };

      # nix_shell = {
      #   symbol = " ";
      #   heuristic = true;
      # };

      container = ss " 󰏖" "yellow dimmed";
      python = ss "" "yellow";
      nodejs = ss " " "yellow";
      lua = ss "󰢱 " "blue";
      rust = ss "" "red";
      java = ss " " "red";
      c = ss " " "blue";
      golang = ss "" "blue";
      docker_context = ss " " "blue";

      nix_shell = ss "@devshell" "blue";

    };
  };

  # programs.starship = {
  #   enable = true;
  #   enableZshIntegration = true;
  #   settings = {
  #     scan_timeout = 10;
  #     add_newline = true;
  #     line_break.disabled = true;
  #     format = "$directory$git_branch$git_metrics$git_commit$git_state$git_status$all";
  #     character = {
  #       success_symbol = "[λ](green)";
  #       error_symbol = "[λ](red)";
  #       vimcmd_symbol = "[λ](green)";
  #     };
  #     directory = {
  #       home_symbol = "home";
  #       style = "cyan";
  #     };
  #     git_commit.tag_symbol = " tag ";
  #     git_branch = {
  #       style = "purple";
  #       symbol = "";
  #     };
  #     git_metrics = {
  #       added_style = "bold yellow";
  #       deleted_style = "bold red";
  #       disabled = false;
  #     };
  #     aws.symbol = "aws ";
  #     bun.symbol = "bun ";
  #     c.symbol = "C ";
  #     cobol.symbol = "cobol ";
  #     conda.symbol = "conda ";
  #     crystal.symbol = "cr ";
  #     cmake.symbol = "cmake ";
  #     daml.symbol = "daml ";
  #     dart.symbol = "dart ";
  #     deno.symbol = "deno ";
  #     dotnet.symbol = ".NET ";
  #     directory.read_only = " ro";
  #     docker_context.symbol = "docker ";
  #     elixir.symbol = "exs ";
  #     elm.symbol = "elm ";
  #     golang.symbol = "go ";
  #     guix_shell.symbol = "guix ";
  #     hg_branch.symbol = "hg ";
  #     java.symbol = "java ";
  #     julia.symbol = "jl ";
  #     kotlin.symbol = "kt ";
  #     lua.symbol = "lua ";
  #     memory_usage.symbol = "memory ";
  #     meson.symbol = "meson ";
  #     nim.symbol = "nim ";
  #     nix_shell.symbol = "nix ";
  #     ocaml.symbol = "ml ";
  #     opa.symbol = "opa ";
  #     nodejs.symbol = "nodejs ";
  #     package.symbol = "pkg ";
  #     perl.symbol = "pl ";
  #     php.symbol = "php ";
  #     pulumi.symbol = "pulumi ";
  #     purescript.symbol = "purs ";
  #     python.symbol = "py ";
  #     raku.symbol = "raku ";
  #     ruby.symbol = "rb ";
  #     rust.symbol = "rs ";
  #     scala.symbol = "scala ";
  #     spack.symbol = "spack ";
  #     sudo.symbol = "sudo ";
  #     swift.symbol = "swift ";
  #     terraform.symbol = "terraform ";
  #     zig.symbol = "zig ";
  #   };
  # };
}
