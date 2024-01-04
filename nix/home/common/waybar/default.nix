{ config, pkgs, ... }:
let
  configHome = config.xdg.configHome;
in {
  home = {
    packages = with pkgs; [
      waybar
      (writeShellScriptBin "waybar-launch" ''
        CONFIG="${configHome}/waybar/config"
        STYLESHEET="${configHome}/waybar/style.css"
        CONFIG_FILES="$CONFIG $STYLESHEET"

        trap "killall .waybar-wrapped" EXIT

        while true; do
          waybar &
          # Kill and restart waybar if its config changes
          inotifywait -e create,modify $CONFIG_FILES
          killall .waybar-wrapped
        done
      '')
    ];

    file = {
      "${configHome}/waybar/config".source = ./config;
      "${configHome}/waybar/style.css".source = ./style.css;
    };
  };
}
