{ _ }:

{
  programs.fish = {
    enable = true;
    defaultShell = true;
    shellsAliases = {
      ls = "lsd -1";
      la = "lsd -1a";
      ll = "lsd -l";
      lla = "lsd -la";
      lst = "lsd --tree --icons never";
    };
    interactiveShellInit = ''
      if command -v starship &> /dev/null; then
        eval "$(starship init fish)"
      end
    '';
  };
}
