{ ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "nm-applet &"
        "poweralertd &"
        "wl-clip-persist --clipboard both &"
        "wl-paste --watch cliphist store &"
        "waybar &"
        "swaync &"
        "hyprctl setcursor Bibata-Modern-Ice 24 &"
        "swww-daemon &"
        "hyprlock"
      ];

      input = {
        kb_layout = "fr, us";
        kb_options = "grp:alt_caps_toggle";
        numlock_by_default = true;
        repeat_delay = 300;
        follow_mouse = 0;
        float_switch_override_focus = 0;
        mouse_refocus = 0;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
      };

      general = {
        "$mainMod" = "SUPER";
        layout = "dwindle";
        gaps_in = 5;
        gaps_out = 4;
        border_size = 5;
        "col.active_border" = "rgb(D5D5D5)";
        "col.inactive_border" = "0x00000000";
      };

      misc = {
        disable_autoreload = true;
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = true;
        # new_window_takes_over_fullscreen = 2;
        middle_click_paste = false;
      };

      dwindle = {
        force_split = 2;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_status = "master";
        special_scale_factor = 1;
      };

      decoration = {
        rounding = 10;

        blur = {
          enabled = true;
          size = 3;
          passes = 2;
          brightness = 1;
          contrast = 1.4;
          ignore_opacity = true;
          noise = 0;
          new_optimizations = true;
          xray = true;
        };

        shadow = {
          enabled = true;
          ignore_window = true;
          offset = "0 2";
          range = 20;
          render_power = 3;
          color = "rgba(00000055)";
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "fade_curve, 0, 0.55, 0.45, 1"
          "degressive, 0, 1, 0.01, 0.95"
          "progressive, 0, 0.01, 0.95, 1"
        ];

        animation = [
          # name, enable, speed, curve, style

          # Windows
          "windowsIn,   1, 2, fluent_decel,  popin 30%" # window open
          "windowsOut,  1, 2, fluent_decel,  popin 0%" # window close.
          "windowsMove, 1, 2, fluent_decel, slide" # everything in between, moving, dragging, resizing.

          # Fade
          "fadeIn,      0, 3,   fade_curve" # fade in (open) -> layers and windows
          "fadeOut,     0, 0,   fade_curve" # fade out (close) -> layers and windows
          "workspaces,  1, 4,   degressive, slide" # styles: slide, slidevert, fade, slidefade, slidefadevert
        ];
      };

      binds = {
        movefocus_cycles_fullscreen = true;
      };

      bind = [
        # show keybinds list
        "$mainMod, F1, exec, show-keybinds"

        # keybindings
        "CTRL ALT, T, exec, kitty"
        "$mainMod, Return, exec, kitty"
        "ALT, Return, exec, [float; size 1111 700] kitty"
        "$mainMod SHIFT, Return, exec, [fullscreen] kitty"
        "$mainMod, B, exec, toggle_waybar"
        "$mainMod, Q, killactive,"
        "$mainMod, F, fullscreen, 0"
        "$mainMod SHIFT, F, fullscreen, 1"
        "$mainMod, Space, exec, toggle_float"
        "$mainMod, D, exec, rofi -show drun || pkill rofi"
        "$mainMod SHIFT, V, exec, [workspace 4 silent] vesktop"
        "$mainMod SHIFT, S, exec, hyprctl dispatch exec '[workspace 5 silent] SoundWireServer'"
        "ALT, Escape, exec, swaylock"
        "$mainMod, Escape, exec, power-menu || pkill power-menu"
        "$mainMod, P, pseudo,"
        "$mainMod, X, togglesplit,"
        "$mainMod, T, exec, toggle_oppacity"
        "$mainMod, E, exec, [float; size 1000 700; center] nemo"
        "$mainMod SHIFT, B, exec, toggle_waybar"
        "$mainMod, C ,exec, hyprpicker -a"
        "$mainMod, W,exec, wallpaper-picker"
        "$mainMod SHIFT, W,exec, hyprctl dispatch exec '[float; size 925 615] waypaper'"
        "$mainMod, N, exec, swaync-client -t -sw"

        # screenshot
        ",Print, exec, screenshot --copy"
        "$mainMod, Print, exec, screenshot --save"
        "$mainMod SHIFT, Print, exec, screenshot --swappy"

        # switch focus
        "$mainMod, left,  movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up,    movefocus, u"
        "$mainMod, down,  movefocus, d"
        "ALT SHIFT, TAB, movefocus, l"
        "ALT, TAB, movefocus, r"

        "CTRL ALT, up, exec, hyprctl dispatch focuswindow floating"
        "CTRL ALT, down, exec, hyprctl dispatch focuswindow tiled"

        # switch workspace
        "ALT, A, workspace, 1"
        "ALT, Z, workspace, 2"
        "ALT, E, workspace, 3"
        "ALT, R, workspace, 4"
        "ALT, X, workspace, 5"
        "$mainMod CTRL, c, movetoworkspace, empty"

        # window control
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"

        "$mainMod CTRL, left, resizeactive, -80 0"
        "$mainMod CTRL, right, resizeactive, 80 0"
        "$mainMod CTRL, up, resizeactive, 0 -80"
        "$mainMod CTRL, down, resizeactive, 0 80"

        "$mainMod ALT, left, moveactive,  -80 0"
        "$mainMod ALT, right, moveactive, 80 0"
        "$mainMod ALT, up, moveactive, 0 -80"
        "$mainMod ALT, down, moveactive, 0 80"

      ];

      # mouse binding
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # windowrule
      windowrulev2 = [

        "float, class:^(nemo)$, title:^(nemo)$"
        "move 50% 50%,title:^(nemo)$"

        "float,class:^(imv)$"
        "float,class:^(mpv)$"

        "pin,class:^(rofi)$, title:^(rofi)$"
        "pin,class:^(waypaper)$, title:^(waypaper)$"

        "float,title:^(Volume Control)$"

        "size 700 450,title:^(Volume Control)$"
        "move 40 55%,title:^(Volume Control)$"

        "float,title:^(Picture-in-Picture)$"
        "float,title:^(Input)$"
        "float,title:^(Input)$"
        "opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$"
        "pin,title:^(Picture-in-Picture)$"

        "opacity 1.0 override 1.0 override, title:^(.*imv.*)$"
        "opacity 1.0 override 1.0 override, title:^(.*mpv.*)$"

        "workspace 5, class:^(Spotify)$"

        "idleinhibit focus, class:^(mpv)$"

        "float,class:^(waypaper)$"
        "size 725 330,class:^(SoundWireServer)$"

        "float,class:^(org.gnome.FileRoller)$"
        "size 700 400,class:^(org.gnome.FileRoller)$"

        "float,class:^(org.pulseaudio.pavucontrol)$"
        "float,class:^(SoundWireServer)$"
        "float,class:^(file_progress)$"
        "float,class:^(confirm)$"
        "float,class:^(dialog)$"
        "float, center, class:^(download)$"
        "float,class:^(notification)$"
        "float,class:^(error)$"
        "float,class:^(confirmreset)$"
        "float,title:^(Open File)$"
        "float,title:^(File Upload)$"
        "float,title:^(branchdialog)$"
        "float,title:^(Confirm to replace files)$"
        "float,title:^(File Operation Progress)$"

        "opacity 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
        "maxsize 1 1,class:^(xwaylandvideobridge)$"
        "noblur,class:^(xwaylandvideobridge)$"

        # borders when only
        "bordersize 5, floating:0, onworkspace:w[t1]"
        "rounding 15, floating:0, onworkspace:w[t1]"
        "bordersize 5, floating:0, onworkspace:w[tg1]"
        "rounding 15, floating:0, onworkspace:w[tg1]"
        "bordersize 5, floating:0, onworkspace:f[1]"
        "rounding 15, floating:0, onworkspace:f[1]"
      ];

      # gaps when only
      workspace = [
        "w[t1], gapsout:5, gapsin:0"
        "w[tg1], gapsout:5, gapsin:0"
        "f[1], gapsout:5, gapsin:0"
      ];
    };

    extraConfig = "
      monitor=,preferred,auto, 1
      xwayland {
        force_zero_scaling = false
      }
    ";
  };
}
