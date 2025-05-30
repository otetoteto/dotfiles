{ pkgs, ... }:
{
	home.packages = with pkgs; [
		cf-terraforming
	];
}