{ pkgs, ... }:
{
  services.pulseaudio.enable = true;
  environment.systemPackages = with pkgs; [ pulseaudioFull ];
}
