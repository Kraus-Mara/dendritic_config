{ pkgs }:
let
  scripts = builtins.filter (f: builtins.match "+\\.sh" f != null) (builtins.attrNames (builtins.readDir ./scripts));
  scriptsBins = builtins.listToAttrs (map
    (f:
      # substring takes "start end str" -> 0 to stringLength f - 3 of the f str
      let name = builtins.substring 0 (builtins.stringLength f - 3) f;
      in {
        # Link name to binary
        inherit name;
        value = pkgs.writeScriptBin name (builtins.readFile ./scripts/${f});
      })
    scripts);
in
{ home.packages = builtins.attrValues scriptsBins; }
