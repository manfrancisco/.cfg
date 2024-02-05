{ config, lib, osConfig, pkgs, ... }:
let
  inherit (lib) mkDefault;
  homeDir = config.home.homeDirectory;
in {
  imports = [
    ./waybar
    ./wofi
  ];

  config = lib.mkIf osConfig.my.desktop.hyprland.enable {
    home = {
      packages = with pkgs; [
        grim
        inotify-tools
        joypixels
        (nerdfonts.override { fonts = [ "FantasqueSansMono" "FiraCode" ]; })
        pavucontrol
        pulseaudio
        psmisc # killall
        slurp
        swaybg
        wl-clipboard
        (writeShellScriptBin "set-bg" ''
          # Exit if the wrong number of arguments are passed
          [ $# -eq 1 ] || exit 1

          ${psmisc}/bin/killall -q swaybg
          ${swaybg}/bin/swaybg -i "$1" &>/dev/null & disown
        '')
      ];

      file.".zprofile" = lib.mkIf osConfig.my.desktop.hyprland.autologin.enable {
        text = ''
          # This script will be run at first login.
          # If no graphical session is running and we're on tty1, start Hyrland.
          [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ] && Hyprland
        '';
      };
    };

    fonts.fontconfig.enable = true;

    nixpkgs.config = {
      allowUnfree = true;
      joypixels.acceptLicense = true;
    };

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        monitor = mkDefault ",preferred, auto, auto";

        exec-once = [
          "waybar-launch"
          "set-bg ${homeDir}/wallpaper/lo-fi/study-girl.jpg"
        ];

        "$mod" = mkDefault "Alt";

        bind = [
          "$mod Shift, X, killactive"
          "$mod Shift, Q, exit"
          "$mod Shift, F, togglefloating"
          "$mod, Return, exec, kitty"
          "$mod, Space, exec, wofi-launch"
          "$mod, J, togglesplit"
          "$mod, F, fullscreen"
          "$mod, P, pseudo"

          # Volume controls
          ",XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
          ",XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
          ",XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"

          # Move focus between windows
          "$mod, H, movefocus, l"
          "$mod, L, movefocus, r"
          "$mod, K, movefocus, u"
          "$mod, J, movefocus, d"

          # Move window within workspace
          "$mod Shift, H, movewindow, l"
          "$mod Shift, L, movewindow, r"
          "$mod Shift, K, movewindow, u"
          "$mod Shift, J, movewindow, d"

          # Switch to workspace
          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"
          "$mod, 6, workspace, 6"
          "$mod, 7, workspace, 7"
          "$mod, 8, workspace, 8"
          "$mod, 9, workspace, 9"
          "$mod, 0, workspace, 10"

          # Move active window to workspace
          "$mod Shift, 1, movetoworkspace, 1"
          "$mod Shift, 2, movetoworkspace, 2"
          "$mod Shift, 3, movetoworkspace, 3"
          "$mod Shift, 4, movetoworkspace, 4"
          "$mod Shift, 5, movetoworkspace, 5"
          "$mod Shift, 6, movetoworkspace, 6"
          "$mod Shift, 7, movetoworkspace, 7"
          "$mod Shift, 8, movetoworkspace, 8"
          "$mod Shift, 9, movetoworkspace, 9"
          "$mod Shift, 0, movetoworkspace, 10"
        ];

        bindm = [
          # Move windows with Alt + LMB
          "$mod, mouse:272, movewindow"
          # Resize floating windows with Alt + RMB
          "$mod, mouse:273, resizewindow"
          # Resize floating windows with Alt + Shift + LMB (better for touchpads)
          "$mod Shift, mouse:272, resizewindow"
        ];

        env = lib.mkMerge [
          (lib.mkIf osConfig.my.desktop.nvidia.enable [
          "LIBVA_DRIVER_NAME,nvidia"
          "XDG_SESSION_TYPE,wayland"
          "GBM_BACKEND,nvidia-drm"
          "__GLX_VENDOR_LIBRARY_NAME,nvidia"
          "WLR_NO_HARDWARE_CURSORS,1"
          ])
          [ "XCURSOR_SIZE, 24" ]
        ];

        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;

          "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 49deg";
          "col.inactive_border" = "rgba(595959aa)";

          resize_on_border = true;
          extend_border_grab_area = 15;
          layout = "dwindle";
        };

        input = {
          kb_layout = "us";
          follow_mouse = "1";

          touchpad = {
            natural_scroll = true;
            clickfinger_behavior = true;
            tap-to-click = true;
          };

          # -1.0 - 1.0, 0 means no modification.
          sensitivity = 0;
        };

        gestures = {
          workspace_swipe = true;
          workspace_swipe_fingers = 3;
        };

        decoration = {
          rounding = 5;
          drop_shadow = true;
          shadow_range = 8;
          shadow_render_power = 3;
        };

        animations = {
          enabled = true;
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };
      };
    };
  };
}
