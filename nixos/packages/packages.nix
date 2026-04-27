{ ... }:
{
  imports = [
    ./systemPackages.nix
    ./fonts.nix
  ];
  nixpkgs.config.allowUnfree = true;
}
