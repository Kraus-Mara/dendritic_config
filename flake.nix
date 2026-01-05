# Taken from vic : https://github.com/vic/dendrix/blob/main/flake.nix
{
  outputs = inputs: import ./. inputs;
  inputs.import-tree.url = "github:vic/import-tree";
  inputs.nixpkgs-lib.url = "github:nix-community/nixpkgs.lib";
  # I think the explaination about nixpkgs-lib is that we can load lib without loading pkgs. 
  # Loading nixos-unstable / stable-XX would be too heavy and slow compared to this.
}
