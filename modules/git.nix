{ ... }:
{
  programs.git = {
    enable = true;
    userName = "waldirborbajr";
    userEmail = "wborbajr@gmail.com";
    extraConfig = {
      pull.rebase = true;
      push.autoSetupRemote = true;
      rebase.autosquash = true;  # automatically squash fixup commits
      init = {
        defaultBranch = "main";
      };
    };
  };
}
