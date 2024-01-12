{ ... }:
{
  imports = [
    ./common
    ./common/desktop
    ./common/hyprland.nix
  ];

  # Workaround for a down server. Remove later.
  manual = {
    html.enable = false;
    manpages.enable = false;
    json.enable = false;
  };

  wayland.windowManager.hyprland.settings."$mod" = "Super";
}
