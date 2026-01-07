{ inputs, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    # hostPlatform is typically "x86_64-linux" or "aarch_64-linux"
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.default;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  xdg-portal = {
    # it helps applications to communicate with the compositors (gtk and hyprland)
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = [ "gtk" ];
      hyprland.default = [
        "gtk"
        "hyprland"
      ];
    };
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}
