{ windowManager, ... }:
{
  imports = [
    ./${windowManager}/${windowManager}.nix
  ];
}
