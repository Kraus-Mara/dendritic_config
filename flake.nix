# Inspired from vic : https://github.com/vic/dendrix/blob/main/flake.nix
{
  outputs = inputs:
    let
      layers = import ./. inputs;
    in
    {
      imports = builtins.attrValues layers;
      systems = [ "x86_64-linux" ];
    };

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    nixpkgs-lib.url = "github:nix-community/nixpkgs.lib";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    home-manager.url = "github:nix-community/home-manager";
    spicetify-nix.url = "github:gerg-l/spicetify-nix";
  };
}
