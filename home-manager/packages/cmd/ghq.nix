{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ghq
  ];
}
