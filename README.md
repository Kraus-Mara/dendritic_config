<p align="right">
  <a href="https://vic.github.io/dendrix/Dendritic-Ecosystem.html#vics-dendritic-libraries"> <img src="https://img.shields.io/badge/Dendritic-Nix-informational?logo=nixos&logoColor=white" alt="Dendritic Nix"/> </a>
</p>

https://github.com/mightyiam/dendritic

Dendritic Configuration of my nixos-config.

### Current structure :

(generated with lsd --tree --icon never or lst ;^) )

```
dendritic-config

        ├── config_modules
        │   ├── home
        │   │   ├── cursor.nix
        │   │   ├── fontpkgs.nix
        │   │   ├── gui
        │   │   │   ├── gtk.nix
        │   │   │   └── rofi.nix
        │   │   ├── hyprland
        │   │   │   ├── config.nix
        │   │   │   ├── hyprland.nix
        │   │   │   ├── hyprlock.nix
        │   │   │   └── variables.nix
        │   │   ├── mainApps
        │   │   │   ├── browser.nix
        │   │   │   ├── explorer.nix
        │   │   │   └── gnomeApps.nix
        │   │   ├── others
        │   │   │   ├── cava.nix
        │   │   │   └── fastfetch.nix
        │   │   ├── scripts
        │   │   │   ├── scripts
        │   │   │   │   └── many scripts
        │   │   │   └── scripts.nix
        │   │   ├── shell
        │   │   │   ├── fish.nix
        │   │   │   ├── pkgShell.nix
        │   │   │   └── starship.nix
        │   │   ├── tty.nix
        │   │   └── utils
        │   │       └── utils nix files
        │   └── layers
        │       ├── options.nix <- to import all the nix files
        │       ├── bootloader
        │       │   ├── filesystems.nix
        │       │   ├── kernel.nix
        │       │   └── systemd-boot.nix
        │       ├── hardware
        │       │   ├── cpu.nix
        │       │   ├── firmware.nix
        │       │   └── graphics.nix
        │       ├── network
        │       │   ├── firewall.nix
        │       │   ├── manager.nix
        │       │   ├── servers.nix
        │       │   ├── TCP.nix
        │       │   └── UDP.nix
        │       ├── pipewire
        │       │   ├── pipewire.nix
        │       │   └── pulseaudio.nix
        │       ├── programs
        │       │   └── programs.nix
        │       ├── security
        │       │   └── security.nix
        │       ├── steam
        │       │   └── steam.nix
        │       ├── system
        │       │   ├── nix-settings.nix
        │       │   ├── nixpkgs.nix
        │       │   ├── time_zone.nix
        │       │   └── version.nix <- Literally the entire system version of NixOS
        │       ├── user
        │       │   ├── home-manager.nix <- here comes the importation of home/ folder
        │       │   ├── shell.nix
        │       │   └── user-base.nix
        │       ├── virtualization
        │       │   └── docker.nix
        │       ├── wayland
        │       │   └── hland.nix
        │       └── xserver
        │           ├── display-manager.nix
        │           ├── layouts.nix
        │           └── xserv.nix
        ├── default.nix
        ├── flake.nix
        └── README.md
```

```
Mara des Woods yeye
```
