{ osConfig, lib, ... }:
{
  config = lib.mkIf osConfig.my.desktop.gnome.enable {
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        clock-show-weekday = true;
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
        cursor-theme = "Adwaita";
        icon-theme = "Adwaita";
        gtk-theme = "Adwaita";
      };
      "org/gnome/desktop/default-applicaitons/terminal" = {
        # Set default terminal
        exec = ["kitty"];
        exec-arg = [];
      };
      "org/gnome/mutter" = {
        # Disable workspaces on secondary monitor
        workspaces-only-on-primary = true;
      };
      "org/gnome/settings-daemon/plugins/power" = {
        # Sleep after one hour on AC
        sleep-inactive-ac-timeout = 3600;
      };
      "org/gnome/shell/keybindings" = {
        switch-to-application-1 = [];
        switch-to-application-2 = [];
        switch-to-application-3 = [];
        switch-to-application-4 = [];
        switch-to-application-5 = [];
        switch-to-application-6 = [];
        switch-to-application-7 = [];
        switch-to-application-8 = [];
        switch-to-application-9 = [];
      };
      "org/gnome/desktop/wm/keybindings" = {
        switch-to-workspace-1 = ["<Super>1"];
        switch-to-workspace-2 = ["<Super>2"];
        switch-to-workspace-3 = ["<Super>3"];
        switch-to-workspace-4 = ["<Super>4"];
        switch-to-workspace-5 = ["<Super>5"];
        switch-to-workspace-6 = ["<Super>6"];
        switch-to-workspace-7 = ["<Super>7"];
        switch-to-workspace-8 = ["<Super>8"];
        switch-to-workspace-9 = ["<Super>9"];
        move-to-workspace-1 = ["<Super><Shift>1"];
        move-to-workspace-2 = ["<Super><Shift>2"];
        move-to-workspace-3 = ["<Super><Shift>3"];
        move-to-workspace-4 = ["<Super><Shift>4"];
        move-to-workspace-5 = ["<Super><Shift>5"];
        move-to-workspace-6 = ["<Super><Shift>6"];
        move-to-workspace-7 = ["<Super><Shift>7"];
        move-to-workspace-8 = ["<Super><Shift>8"];
        move-to-workspace-9 = ["<Super><Shift>9"];
        switch-to-workspace-left = ["<Super>h"];
        switch-to-workspace-right = ["<Super>l"];
        move-to-monitor-left = ["<Super><Shift>h"];
        move-to-monitor-right = ["<Super><Shift>l"];
        # Disable Super+L keybinding for hide window
        minimize = [];
      };
      "org/gnome/settings-daemon/plugins/media-keys" = {
        # Disable Super+L keybinding for screen lock
        screensaver = [];
      };
    };
  };
}
