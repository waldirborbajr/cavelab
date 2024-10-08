{ pkgs, ... }:

{
  programs.gh = {
    enable = true;
      settings = {
        version = "1";
	aliases = {
	  "as" = "auth status";
	};
      };
      gitCredentialHelper.enable = true;
      extensions = [ pkgs.gh-eco ];
  };
}

