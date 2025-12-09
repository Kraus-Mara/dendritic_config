# squelette de system.nix
{ inputs, ... }:

{ 
  imports = [
    ./hardware-configuration.nix
    ../modules/core
    ../modules/home
  ];
  networking.hostName = /* "hostname" */;
  time.timeZone = "Europe/Paris";
  i18n = {
    defaultLocale = "fr_FR.UTF-8";
    supportedLocales = "fr_FR.UTF-8" "en_US.UTF-8" ];
  };

  users.users./*username*/ = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "networkmanager" ];
  };

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    networkmanager.enable = true;

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users = {
        /*username*/ = import ../modules/home;
      }
    };
    
    environment.systemPackages = [
      pkgs.git
      pkgs.vim
    ];
  };
