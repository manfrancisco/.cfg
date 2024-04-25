{ config, lib, ... }: {
  options.my.hyprland = {
    enable = lib.my.mkBoolOption false;
    # Do not enable when other DE's are enabled
    autologin = lib.my.mkEnableOption false;
  };

  config = lib.mkIf config.my.hyprland.enable {
    hardware = {
      opengl.enable = true;
      # Most wayland compositors need this
      nvidia.modesetting.enable = true;
    };
  };
}
