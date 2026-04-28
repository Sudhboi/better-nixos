{ ... }:

{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        extraConfig = ''
          [ids]

          *

          [main]

          capslock = overload(control, esc)
          insert = capslock
          f23+leftshift+leftmeta = C-f10
        '';
      };
    };
  };
}
