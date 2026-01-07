{ lib, ... }:

{

  palette = "default";
  programs.starship = {
    enable = true;

    enableBashIntegration = true;

    settings = {
      format = lib.concatStrings [
        "[](color_orange)"
        "$os"
        "[](bg:color_yellow fg:color_orange)"
        "$directory"
        "[](fg:color_yellow bg:color_aqua)"
        "$git_branch"
        "$git_status"
        "[](fg:color_aqua bg:color_blue)"
        "$nix_shell"
        "[](fg:color_blue bg:color_bg3)"
        "$cmd_duration"
        "[](fg:color_bg3) "
      ];

      palettes = {
        pink = {
          color_aqua = "#745d8a";
          color_bg1 = "#251b2e";
          color_bg3 = "#42314b";
          color_blue = "#926ba2";
          color_fg0 = "#d9b0cf";
          color_green = "#7f6291";
          color_orange = "#b47d95";
          color_purple = "#906895";
          color_red = "#a56876";
          color_yellow = "#c08ea7";
        };
        ashen = {
          color_aqua = "#949494";
          color_bg1 = "#1c1f24";
          color_bg3 = "#676767";
          color_blue = "#3C3C3C";
          color_fg0 = "#c5c8d0";
          color_green = "#7a8f94";
          color_orange = "#5B5B5B";
          color_purple = "#8f7aa4";
          color_red = "#8f7a7a";
          color_yellow = "#373737";
        };
        default = {
          color_orange = "#b35c00";
          color_yellow = "#bfa94a";
          color_aqua = "#4e7c8a";
          color_blue = "#486199";
          color_bg3 = "#181825";
          color_fg0 = "#cdd6f4";
          color_red = "#a23a4d";
          color_green = "#4d6f4a";
        };
      };

      os = {
        disabled = false;
        style = "bg:color_orange bold fg:color_fg0";
        symbols = {
          NixOS = " ";
        };
      };

      directory = {
        style = "bold fg:color_fg0 bg:color_yellow";
        format = "[ $path ]($style)";
        truncation_length = 3;
      };

      git_branch = {
        symbol = "";
        style = "bg:color_aqua";
        format = "[[ $symbol $branch ](bold fg:color_fg0 bg:color_aqua)]($style)";
      };

      git_status = {
        style = "bg:color_aqua bold fg:color_fg0";
        format = "[$all_status$ahead_behind]($style)";
      };

      nix_shell = {
        format = "[ via nix $name ]($style)";
        style = "bg:color_blue bold fg:color_fg0";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:color_bg1";
        format = "[[   $time ](fg:color_fg0 bg:color_bg1)]($style)";
      };

      cmd_duration = {
        format = "[ 󰔛 $duration ]($style)";
        disabled = false;
        style = "bg:color_bg3 fg:color_fg0";
        show_notifications = false;
        min_time_to_notify = 60000;
      };

      line_break = {
        disabled = false;
      };

      character = {
        disabled = false;
        success_symbol = "[  ](bold fg:color_green)";
        error_symbol = "[  ](bold fg:color_red)";
      };
    };
  };
}
