inputs:
let
  inherit (inputs.nixpkgs-lib) lib;

  dendrix =
    layers // { inherit sources; }; # add // community if you need

  sources = import ./config_modules/home;

  # community = lib.mapAttrs (_: r: r.import-tree) ev.config.dendrix.community;
  layers = ev.config.dendrix.layers;

  module = inputs.import-tree [
    # ./config_modules/community
    ./config_modules/layers/options.nix
  ];

  ev = lib.modules.evalModules {
    # We're asking to evaluate the modules imported from import-tree
    modules = [ module ];
    specialArgs = { inherit inputs; };
  };
in
dendrix
