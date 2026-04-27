{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.iosevka-term
    nerd-fonts.symbols-only
    nerd-fonts.jetbrains-mono
    nerd-fonts.daddy-time-mono
  ];
}
