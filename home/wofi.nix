{ config, lib, osConfig, pkgs, ... }:
let
  configHome = config.xdg.configHome;
in {
  config = lib.mkIf osConfig.my.desktop.hyprland.enable {
    home = {
      packages = with pkgs; [
        wofi
        (writeShellScriptBin "wofi-launch" ''
          ${psmisc}/bin/killall -q wofi
          # Wait until the processes have been shut down
          while pgrep -x wofi >/dev/null; do sleep 1; done

          ${wofi}/bin/wofi --show=drun --lines=5 --prompt="" --hide-scroll --insensitive --columns=2
        '')
      ];

      file."${configHome}/wofi/style.css".source = ./cfg/wofi.css;
    };
  };
}
