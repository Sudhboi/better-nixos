{
  config,
  pkgs,
  ...
}:

{
  home.username = "sudhirk";
  home.homeDirectory = "/home/sudhirk";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = [
    (pkgs.lib.mkIf config.hostName.hornet pkgs.yazi)
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
