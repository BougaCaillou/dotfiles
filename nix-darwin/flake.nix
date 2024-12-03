{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = [
        pkgs.vim
      ];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      security.pam.enableSudoTouchIdAuth = true;

      system.defaults = {
        dock.autohide = true;
        dock.mru-spaces = false;
        loginwindow.LoginwindowText = "Pire dev de fronss";
      };

      homebrew.enable = true;
      homebrew.brews = [
        "asdf"
        "cantino/mcfly/mcfly"
        "curlie"
        "derailed/k9s/k9s"
        "dust"
        "eth-p/software/bat-extras"
        "eza"
        "fd"
        "fzf"
        "git"
        "gnu-sed"
        "glow"
        "go"
        "gum"
        "helmfile"
        "jq"
        "kubectx"
        "lolcat" # of course
        "make"
        "neovim"
        "pgcli"
        "postgresql@17"
        "procs"
        "starship"
        "tldr"
        "tmux"
        "tree"
        "zoxide"
        "zsh-autosuggestions"
        "zsh-syntax-highlighting"
        "zx"
      ];
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#MacBook-Air-de-Pierre
    darwinConfigurations."MacBook-Air-de-Pierre" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        home-manager.darwinModules.home-manager {
          users.users.pierre.home = "/Users/pierre";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.pierre = import ./home.nix;
        }
      ];
    };

    # imports = [ <home-manager/nix-darwin> ];

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."MacBook-Air-de-Pierre".pkgs;
  };
}
