{
  pkgs,
  hostName,
  ...
}:

{
  home.username = "sudhirk";
  home.homeDirectory = "/home/sudhirk";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages =
    if (hostName == "hornet") then
      [
        pkgs.yazi
      ]
    else
      [ ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
