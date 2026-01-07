# Work in progress

https://github.com/mightyiam/dendritic

Skeleton to match the dendritic pattern in my NixOS config

### Current structure :

(generated with lsd --tree --icon never or lst ;^) )

```
.
├── config_modules
│   └── layers
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
│       ├── options.nix
│       ├── pipewire
│       │   ├── pipewire.nix
│       │   └── pulseaudio.nix
│       ├── programs
│       │   ├── fish.nix
│       │   └── programs.nix
│       ├── security
│       │   └── security.nix
│       ├── system
│       │   ├── nix-settings.nix
│       │   ├── nixpkgs.nix
│       │   ├── time_zone.nix
│       │   └── version.nix
│       └── user
│           ├── home-manager.nix
│           ├── shell.nix
│           └── user-base.nix
├── default.nix
├── flake.nix
└── README.md

```

```
Mara des Woods yeye

```
