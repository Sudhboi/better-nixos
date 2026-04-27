{ config, ... }:
{
  programs.neovim.defaultEditor = true;
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ./nvim;
}
