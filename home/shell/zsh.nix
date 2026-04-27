{ hostName, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      "nrs" = "nh os switch $HOME/.dotfiles";
      "hms" = "nh home switch $HOME/.dotfiles -c ${hostName}";
    };
  };
}
