{ ... }:

{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--preview 'bat -p -f {}'"
      "--height 50%"
      "--layout=reverse"
      "--border"
      "--inline-info"
    ];    
  };
  programs.bash.enable = true;
}
