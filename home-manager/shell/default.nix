{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    sheldon
  ];

  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    initContent = builtins.readFile ./.zshrc;
    autocd = true;
  };

  home.file.".config/sheldon/plugins.toml".source = ./plugins.toml;
  home.file.".config/zsh/git.zsh".source = ./git.zsh;

  programs.starship = {
    enable = true;

    enableZshIntegration = true;

    settings = {
      add_newline = true;

      character = {
        success_symbol = "[>>>](bold green)";
        error_symbol = "[>>>](bold red)";
      };

      time = {
        disabled = false;
        format = "[\\[$time\\]]($style) ";
        time_format = "%R";
        utc_time_offset = "+9";
      };

      git_status = {
        staged = "[+$count](green)";
      };

      aws = {
        disabled = true;
      };

      package = {
        disabled = true;
      };
    };
  };
}
