{
  pkgs,
  hostName,
  ...
}:

{
  imports = [
    ./shell/shell_stuff.nix
    ./editor/editor.nix
  ];

  home.username = "sudhirk";
  home.homeDirectory = "/home/sudhirk";
  programs.home-manager.enable = true;
  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    yazi
    neovim
  ];
}
