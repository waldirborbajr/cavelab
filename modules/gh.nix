# https://nix-community.github.io/home-manager/options.html#opt-programs.gh.settings

{pkgs, ...}: {
  programs.gh = {
    enable = true;
     extensions = [
      pkgs.gh-dash
    ];
    settings = {
      # version = "1";
      git_protocol = "ssh";
      prompt = "enabled";
      pager = "delta";
      editor = "nvim";
      git_protocol = "ssh";
      aliases = {
        clone = "repo clone";
        co = "pr checkout";
        ga = "dash";
        inbox = "api notifications --template '{{range .}}{{tablerow .subject.title .subject.url}}{{end}}'";
        pl = "pr list";
        pr = "pr create --web";
        pv = "pr view --web";
        v = "repo view --web";
      };
    };
  };

}
