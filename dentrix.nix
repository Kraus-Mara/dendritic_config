# dentrix.nix skeleton
{ inputs, ...} : {
  nixosConfigurations = {
    dentrix = {
      system = "x86_64-linux";
      modules = [
        ./modules/hardware/hardware-configuration.nix
	./modules/core/default.nix
	./modules/home/default.nix
      ];
    };
  };
}
