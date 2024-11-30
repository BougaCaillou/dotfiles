# home.nix

{ config, pkgs, ...}:

{
  home.username = "pierre";
  home.homeDirectory = "/Users/pierre";
  home.stateVersion = "23.05";

  home.packages = [
  ];
}
