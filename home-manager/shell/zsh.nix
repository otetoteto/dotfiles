{ ... }:
{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    initExtra = builtins.readFile ./.zshrc;
    autocd = true;
  };

  home.file.".config/sheldon/plugins.toml".source = ./plugins.toml;
}
