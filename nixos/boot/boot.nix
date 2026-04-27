{ pkgs, ... }:
{
  boot = {

    plymouth = {
      enable = true;
      theme = "pixels";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [
            "rings"
            "connect"
            "pixels"
          ];
        })
      ];
    };

    # Enable "Silent boot"
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=auto"
      # "zswap.enabled=1" # enables zswap
      # "zswap.compressor=lz4" # compression algorithm
      # "zswap.max_pool_percent=20" # maximum percentage of RAM that zswap is allowed to use
      # "zswap.shrinker_enabled=1" # whether to shrink the pool proactively on high memory pressure
    ];

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      timeout = 0;
    };
  };
}
