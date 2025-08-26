{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      # Package search: https://search.nixos.org/packages?channel=24.11&from=0&size=50&sort=relevance&type=packages
      environment.systemPackages = [
        pkgs.atuin
        pkgs.vim
        pkgs.cargo
        pkgs.curlie
        pkgs.k9s
        pkgs.dust
        pkgs.eza
        pkgs.fd
        pkgs.fzf
        pkgs.git
        pkgs.gnused
        pkgs.glow
        pkgs.go
        pkgs.gum
        pkgs.imgcat
        pkgs.jq
        pkgs.kubectx
        pkgs.lazydocker
        pkgs.lolcat # of course
        pkgs.gnumake
        pkgs.gnupg1
        pkgs.jqp
        pkgs.mongosh
        pkgs.neovim
        pkgs.pgcli
        pkgs.procs
        pkgs.starship
        pkgs.tldr
        pkgs.tmux
        pkgs.tree
        pkgs.zoxide
        pkgs.zsh-autosuggestions
        pkgs.zsh-syntax-highlighting
        pkgs.zx
      ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Primary user setup
      system.primaryUser = "pierre";

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      system.defaults = {
        dock.autohide = true;
        dock.mru-spaces = false;
        loginwindow.LoginwindowText = "Pire dev de fronss";
      };

      homebrew.enable = true;
      homebrew.taps = [
        "silenceper/tap"
      ];
      homebrew.brews = [
        "asdf"
        "eth-p/software/bat-extras"
        "postgresql@17"
        "maven"
        "imagemagick"
        "gowatch"
        "yq"
      ];
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#MacBook-Air-de-Pierre
    darwinConfigurations."MacBook-Air-de-Pierre" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."MacBook-Air-de-Pierre".pkgs;
  };
}
