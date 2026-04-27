{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    python3
    wget
    libnotify
    brightnessctl
    gnumake
    ripgrep
    libtool
    zip
    unzip
    coreutils
    pciutils
    gcc
    fd
    clang
    cmake
    rustup
  ];
}
