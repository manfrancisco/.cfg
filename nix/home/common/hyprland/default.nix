{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };

  home.packages = with pkgs; [
    inotify-tools
    joypixels
    (nerdfonts.override { fonts = [ "FantasqueSansMono" "FiraCode" ]; })
    pavucontrol
    pulseaudio
    psmisc # killall
    swaybg
    waybar
    wl-clipboard
    wofi
  ];

  fonts.fontconfig.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
    joypixels.acceptLicense = true;
  };
}
