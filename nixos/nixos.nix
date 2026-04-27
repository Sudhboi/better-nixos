{
  config,
  pkgs,
  hostName,
  ...
}:

{
  imports = [
    ../hosts/hornet/hardware-configuration.nix
    # ./boot/boot.nix
    ./packages/packages.nix
    ./users/users.nix
    ./shell/zsh.nix
    ./localisation/localisation.nix
    ./nixLd/nixLd.nix
    ./networking/networking.nix
    ./windowManager/windowManager.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;

  system.stateVersion = "25.11"; # Did you read the comment?

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
