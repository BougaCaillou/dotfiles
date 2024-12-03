# home.nix

{ config, pkgs, ...}:

{
  home.username = "pierre";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  home.packages = [ ];

  home.file = {
    ".zshrc".source = ../omz/.zshrc;
    ".asdfrc".source = ../asdf/.asdfrc;
    ".gitconfig".source = ../git/.gitconfig;
    ".tmux.conf".source = ../tmux/.tmux.conf;
    ".config/bat".source = ../bat;
    ".config/nix".source = ../nix;
    ".config/nvim".source = ../nvim;
    ".config/starship.toml".source = ../starship/starship.toml;
    ".config/wezterm".source = ../wezterm;
  };
}
