# Squelette de config.nix

{
  imports = [
  ];

  nixpkgs = {
    
    overlays = [
      # ...
    ];
    
    config = {
      allowUnFree = true;
    };
  };

  flake = {
    nixosModules.core = ./modules/core;
    homeModules.default = ./modules/home;
  };
}
