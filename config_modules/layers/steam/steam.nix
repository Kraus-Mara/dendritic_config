{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
      # Proton adds a compatibility layer : DirectX -> Vulkan 
      # It allows Windows game to be run on Linux 
    };
    gamescope = {
      enable = true;
      capSysNice = true; # reduce freezes, jitter, increase fps stability
      args = [
        "--rt"
        # RT scheduling gives a process real-time priority at the kernel level
        # It ensures it runs with minimal latency by preempting normal tasks
        # It improves frame pacing and reduces stutter.
        "--expose-wayland"
      ];
    };
  };
}
