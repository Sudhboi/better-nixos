{ inputs, ... }:
{
  imports = [ inputs.niri.homeModules.niri ];

  home.file.".config/niri/config.kdl".source = ./config.kdl;
  home.file.".config/niri/scripts/niri_tile_to_n.py".source = ./scripts/niri_tile_to_n.py;
  home.file.".config/niri/modules".source = ./modules;
}
