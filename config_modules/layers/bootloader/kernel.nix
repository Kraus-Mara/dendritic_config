{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.blacklistedKernelModules = [
    "usbcore"
    "ehci_pci"
    "xhci_pci"
    "ohci_pci"
  ];
  boot.kernelParams = [ "usbcore.autosuspend=-1" ];
}
