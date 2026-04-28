{ inputs, ... }:
{
  imports = [ inputs.niri.homeModules.niri ];

  programs.niri.config = ''
    include "modules/animations.kdl"
  '';

  home.file.".config/niri/scripts/niri_tile_to_n.py".source = ./scripts/niri_tile_to_n.py;
  home.file.".config/niri/modules".source = ./modules;
}
