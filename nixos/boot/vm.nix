{ ... }:
{
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
}
