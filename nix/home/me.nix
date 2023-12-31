{ config, ... }:
let
  configHome = config.xdg.configHome;
in {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "me";
  home.homeDirectory = "/home/me";

  programs.browserpass.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".gitconfig".source = ../../git/.gitconfig;
    ".tmux.conf".source = ../../tmux/.tmux.conf;
    ".vimrc".source = ../../vim/.vimrc;
    ".zshrc".source = ../../zsh/.zshrc;
    "${configHome}/hypr/hyprland.conf".source = ../../hyprland-nix/.config/hypr/hyprland.conf;
    # "${configHome}/nvim/".source = ../../nvim/.config/nvim;
    "${configHome}/waybar".source = ../../waybar/.config/waybar;
    "${configHome}/wofi".source = ../../wofi/.config/wofi;
    "${configHome}/zsh".source = ../../zsh/.config/zsh;

    ".gnupg/gpg-agent.conf".text = ''
      default-cache-ttl 604800
      max-cache-ttl 604800
    '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/me/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.
}
