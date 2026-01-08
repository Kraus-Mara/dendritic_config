# Inspired from vic : https://github.com/vic/dendrix/blob/main/flake.nix
{
  description = "Kraus-Mara dendritic flake for the nixOS configuration";

  outputs = inputs:
    let
      layers = import ./. inputs;
      username = "kraus"; # <- your username
      system = "x86_64-linux";
    in
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ system ];

      imports = builtins.attrValues layers;

      flake.nixosConfigurations.${username} = inputs.nixpkgs.lib.nixosSystem {
        # it allows to call nixos-rebuild switch --flake .#username
        inherit system;
        modules = [
          ./hardware-configuration.nix
        ];
        specialArgs = {
          inherit inputs username;
        };
      };
    };

  inputs = {
    flake-parts. url = "github:hercules-ci/flake-parts";
    import-tree. url = "github:vic/import-tree";
    nixpkgs-lib. url = "github:nix-community/nixpkgs.lib";
    nixpkgs. url = "github:NixOS/nixpkgs/nixos-unstable";
    nur. url = "github:nix-community/NUR";
    hyprland. url = "github:hyprwm/Hyprland";
    hypr-contrib. url = "github:hyprwm/contrib";
    hyprpicker. url = "github:hyprwm/hyprpicker";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs. nixpkgs. follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs. nixpkgs. follows = "nixpkgs";
    };
  };
}
