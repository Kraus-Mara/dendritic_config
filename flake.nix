{
  description = "Dendritic pattern skeleton";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github.com:hercules-ci/flake-parts";
  };

  outputs = inputs@{flake-parts, ...}:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64_linux" ];

      imports = [ # Simply put your hardware-configuration.nix in the parts/ folder then complete the config.nix skeleton
        ./parts/config.nix
	./parts/system.nix # Here's the dotNix file that will import hardware-configuration.nix
      ];

      flake = {};
    };
}
