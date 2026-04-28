{ hostName, ... }:
{
  imports = if (hostName == "knight") then [ ./nvidia.nix ] else [ ];
}
