{ inputs, username, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    programs.home-manager.enable = true;
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs username;
    };
    users.${username} = {
      imports = [ inputs.import-tree ../../home ];
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        # Only change stateVersion to the version on which you installed home-manager 
        # https://nix-community.github.io/home-manager/
        stateVersion = "25.11";
      };
    };
  };
}
