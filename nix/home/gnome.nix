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
    };
  };
}
