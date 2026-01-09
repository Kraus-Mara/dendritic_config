inputs:
let
  # lib allows to access evalModules
  inherit (inputs.nixpkgs-lib) lib;

  # so, evaluated layers :
  inherit (ev.config.layers_modules) evaluated_layers;

  # non-evaluated module here
  layers_modules = inputs.import-tree [
    ./config_modules/layers/options.nix
  ];
  # ev allows ev.module to evaluate the given module
  ev = lib.modules.evalModules {
    modules = [ layers_modules ];
    specialArgs = { inherit inputs; };
  };
in
evaluated_layers
