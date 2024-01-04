{config, pkgs, ... }:
{
  imports = [
    ../waybar
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
      wofi
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
    extraConfig = builtins.readFile ./hyprland.conf;
    settings = {
      exec-once = "waybar-launch";
    };
  };
}
