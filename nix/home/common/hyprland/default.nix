{ config, pkgs, ... }:
{
  imports = [
    ../waybar
    ../wofi
  ];

  home = {
    packages = with pkgs; [
      inotify-tools
      joypixels
      (nerdfonts.override { fonts = [ "FantasqueSansMono" "FiraCode" ]; })
      pavucontrol
      pulseaudio
      psmisc # killall
      swaybg
      wl-clipboard
      (writeShellScriptBin "set-bg" ''
        # Exit if the wrong number of arguments are passed
        [ $# -eq 1 ] || exit 1

        ${psmisc}/bin/killall
        ${swaybg}/bin/swaybg -i "$1" &>/dev/null & disown
      '')
    ];

    file.".zprofile".text = ''
      # This script will be run at first login.
      # If no graphical session is running and we're on tty1, start Hyrland.
      [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ] && Hyprland
    '';
  };

  fonts.fontconfig.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
    joypixels.acceptLicense = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./cfg/hyprland.conf;
    settings = {
      exec-once = [
        "waybar-launch"
        "set-bg ${config.home.homeDirectory}/wallpaper/lo-fi/study-girl.jpg"
      ];
    };
  };
}
