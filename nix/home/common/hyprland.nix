{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    extraConfig = builtins.readFile ../../../hyprland-nix/.config/hypr/hyprland.conf;
  };
}
