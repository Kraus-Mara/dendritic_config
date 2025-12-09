# dentrix.nix skeleton
{ inputs, ...} : {
  nixosConfigurations = {
    dentrix = {
      modules = [
        ./modules/hardware/hardware-configuration.nix
	./modules/core/default.nix
	./modules/home/default.nix
      ];
    };
  };
}
