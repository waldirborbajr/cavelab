{
  programs.bat = {
    enable = true;
    config = {
      inherit (defaults) pager;
      color = "always";
      style = "changes";
    };
  };
}
