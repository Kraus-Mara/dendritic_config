inputs:
let
  inherit (inputs.nixpkgs-lib) lib;
  inherit (ev.config.dendrix) layers;

  module = inputs.import-tree [
    ./config_modules/layers/options.nix
  ];

  ev = lib.modules.evalModules {
    # We're asking to evaluate the modules imported from import-tree
    modules = [ module ];
    specialArgs = { inherit inputs; };
  };
in
layers
