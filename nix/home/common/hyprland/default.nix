{config, pkgs, ... }:
{
  imports = [
    ../waybar
  ];

  home.packages = with pkgs; [
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
