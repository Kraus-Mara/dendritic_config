{ lib, inputs, ... }:
let

  layersOption = lib.mkOption {
    description = "layers are the core modules of the config";
    default = discoverLayers;
    readOnly = true;
    type = lib.types.attrsOf lib.types.attrs;
  };

  discoverLayers = lib.pipe ./. [
    builtins.readDir
    (lib.mapAttrsToList (name: type: { inherit name type; }))
    (lib.filter (x: x.type == "directory"))
    (lib.map (x: x.name))
    (lib.map (name: {
      ${name} = {
        imports = [
          (inputs.import-tree ./${name})
        ];
      };
    }))
    lib.mergeAttrsList
  ];

in
{
  # Selected options
  options.evaluated_layers = layersOption;
}
