# flake skeleton
{
  description = "";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/pkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{flake-parts, ...}:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64_linux" ];

      imports = [
        ./dentrix.nix
      ];
    };
}
