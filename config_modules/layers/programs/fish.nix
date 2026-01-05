{ _ }:

{
  programs.fish = {
    enable = true;
    shellsAliases = {
      ls = "lsd -1";
      la = "lsd -1a";
      ll = "lsd -l";
      lla = "lsd -la";
      lst = "lsd --tree --icons never";
    };
  };
}
