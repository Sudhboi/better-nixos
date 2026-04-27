{
  pkgs,
  hostName,
  ...
}:

{
  home.username = "sudhirk";
  home.homeDirectory = "/home/sudhirk";
  programs.home-manager.enable = true;
  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages =
    if (hostName == "hornet") then
      [
        pkgs.yazi
        pkgs.neovim
      ]
    else
      [ ];

}
