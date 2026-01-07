{ pkgs, ... }:

let
  catppuccinMocha = {
    rosewater = "#f5e0dc";
    flamingo = "#f2cdcd";
    pink = "#f5c2e7";
    mauve = "#cba6f7";
    red = "#df6464";
    maroon = "#eba0ac";
    peach = "#fab387";
    yellow = "#e5a72a";
    green = "#a6e3a1";
    teal = "#94e2d5";
    sky = "#89dceb";
    sapphire = "#74c7ec";
    blue = "#89b4fa";
    lavender = "#b4befe";

    text = "#d5d5d5";
    subtext1 = "#bac2de";
    subtext0 = "#a6adc8";
    overlay2 = "#9399b2";
    overlay1 = "#7f849c";
    overlay0 = "#6c7086";
    surface2 = "#373737";
    surface1 = "#45475a";
    surface0 = "#313244";
    base = "#121212";
    mantle = "#181825";
    crust = "#11111b";
  };
in
{
  home.packages = [ pkgs.rofi ];

  xdg.configFile."rofi/theme.rasi".text = ''
    * {
      bg-col:      ${catppuccinMocha.base};
      bg-col-light:${catppuccinMocha.yellow};
      border-col:  ${catppuccinMocha.base};
      selected-col:${catppuccinMocha.surface2};
      green:       ${catppuccinMocha.green};
      yellow:      ${catppuccinMocha.yellow};
      red:         ${catppuccinMocha.red};
      fg-col:      ${catppuccinMocha.text};
      fg-col2:     ${catppuccinMocha.red};
      grey:        ${catppuccinMocha.surface2};
      highlight:   @yellow;
    }
  '';

  xdg.configFile."rofi/config.rasi".text = ''
    configuration {
      modi: "run,drun,window";
      lines: 5;
      cycle: false;
      font: "FiraCode Nerd Font 11";
      show-icons: true;
      icon-theme: "Papirus-Dark";
      terminal: "kitty";
      drun-display-format: "{icon} {name}";
      location: 0;
      disable-history: true;
      hide-scrollbar: true;
      display-drun: "~/kraus";
      sidebar-mode: false;
      sorting-method: "fzf";
    }

    @theme "theme"

    element-text, element-icon, mode-switcher {
      background-color: inherit;
      text-color:       inherit;
    }

    window {
      height: 270px;
      width: 500px;
      border: 0px;
      border-color: @border-col;
      background-color: @bg-col;
      border-radius: 3px;
    }

    mainbox {
      background-color: @bg-col;
      border-radius: 3px;
    }

    inputbar {
      children: [prompt, entry];
      background-color: @grey;
      border-radius: 3px;
      padding: 0px;
    }

    prompt {
      background-color: @bg-col;
      padding: 4px;
      text-color: @bg-col-light;
      border-radius: 3px;
      margin: 2px 0px 2px 2px; 
    }

    textbox-prompt-colon {
      expand: false;
      str: ":";
    }

    entry {
      padding: 4px;
      margin: 2px 2px 2px 0px;
      text-color: @fg-col;
      background-color: @bg-col;
      border-radius: 3px;
    }

    listview {
      border: 1px;
      padding: 2px 0px 0px;
      margin: 2px 0px 0px 4px;
      columns: 1;
      background-color: @bg-col;
      cycle: true;
    }

    element {
      padding: 4px;
      margin: 0px 4px 2px 4px;
      background-color: @bg-col;
      text-color: @fg-col;
    }

    element-icon {
      size: 20px;
    }

    element selected {
      background-color: @selected-col;
      text-color: @fg-col2;
      border-radius: 3px;
    }

    mode-switcher {
      spacing: 0;
    }

    button {
      padding: 10px;
      background-color: @bg-col-light;
      text-color: @grey;
      vertical-align: 0.5;
      horizontal-align: 0.5;
      border-radius: 3px;
    }

    button selected {
      background-color: @bg-col;
      text-color: @green;
      border-radius: 3px;
    }
  '';
}
