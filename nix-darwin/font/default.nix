{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      udev-gothic-nf
    ];
  };
}
