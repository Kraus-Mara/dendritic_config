{ _ }:
{
  programs.ssh = {
    enableDefaultConfig = false;
    enable = true;
    matchBlocks = {
      github = {
        host = "github.com";
        hostname = "ssh.github.com";
        user = "git";
        port = 443;
        identityFile = "~/.ssh/id_github";
        identitiesOnly = true;
        controlPersist = "10m";
        controlPath = "~/.ssh/control-%r@%h:%p";
        controlMaster = "auto";
        addKeysToAgent = "yes";
      };
    };
  };

  services.ssh-agent.enable = true;
}
