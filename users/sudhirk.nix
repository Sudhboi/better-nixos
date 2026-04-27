{ config, pkgs, ... }:

{
  home.username = "sudhirk";
  home.homeDirectory = "/home/sudhirk";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = [
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
