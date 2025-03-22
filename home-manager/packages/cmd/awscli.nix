{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aws-vault
  ];

  programs.awscli = {
    enable = true;
  };
}
