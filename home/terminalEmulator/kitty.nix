{ ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      font_size = 11.5;
      cursor_shape = "beam";
      window_padding_width = 3;
      background = "#2e3440";
      # background_opacity = 0.9;
      # dynamic_background_opacity = true;
      # allow_remote_control = true;
      font_family = "IosevkaTerm Nerd Font";
      cursor_trail = "3";
    };
    themeFile = "Catppuccin-Mocha";
  };
}
