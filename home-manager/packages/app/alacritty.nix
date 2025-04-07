{ ... }:
{
  programs.alacritty = {
    enable = true;

    theme = "github_dark_dimmed";

    settings = {
      window = {
        opacity = 0.95;
        startup_mode = "Maximized";
      };

      font = {
        size = 12.0;
        normal = {
          family = "UDEV Gothic 35NFLG";
          style = "Regular";
        };
      };
    };
  };
}
