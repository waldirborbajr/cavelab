# {
#   programs.eza = {
#     enable = true;
#     enableZshIntegration = true;
#     extraOptions = ["--group-directories-first" "--header"];
#     colors = "always";
#     icons = "always";
#     git = true;
#   };
# }

{
  programs.eza = {
    icons = "auto";

    enableNushellIntegration = false;

    extraOptions = [
      "-l"
      "-a"
      "--group"
      "--group-directories-first"
      "--no-user"
      "--no-time"
      "--no-permissions"
      "--octal-permissions"
    ];
  };
}
