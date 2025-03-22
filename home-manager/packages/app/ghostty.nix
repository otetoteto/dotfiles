{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = null; # broken
    enableZshIntegration = true;

    settings = {
      font-family = "'UDEV Gothic 35NFLG'";
      theme = "Github-Dark-Dimmed";
      font-size = 12;
      window-padding-x = 16;
      window-padding-y = 4;
      window-padding-balance = true;
      window-theme = "system";
      background-opacity = 0.85;
      background-blur-radius = 16;

      keybind = [
        "global:cmd+g=toggle_visibility"
      ];
    };
  };
}
