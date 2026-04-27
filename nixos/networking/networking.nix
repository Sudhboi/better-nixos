{ hostName, ... }:
{
  imports = [
    ./openssh.nix
  ];

  networking = {
    hostName = "${hostName}";
  };
  networking.networkmanager.enable = true;
}
