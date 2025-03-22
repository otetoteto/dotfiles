{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
let
  username = "eto";
in
{
  programs.home-manager.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "24.11";
  };

  imports = [
    ./packages
    ./shell
  ];
}
