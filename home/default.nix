{ config, lib, pkgs, ... }: {
  imports = [ ./gnome.nix ./hyprland.nix ./lutris.nix ./nixvim.nix ];

  options.my = {
    btrfs = lib.my.mkEnableOption false;
    desktop = lib.my.mkEnableOption false;
    gpg = lib.my.mkEnableOption true;
    nvim = lib.my.mkEnableOption true;
    pass = lib.my.mkEnableOption true;
    zsh = lib.my.mkEnableOption true;
  };

  config = lib.mkMerge [
    {
      nixpkgs.config.allowUnfree = true;
      programs.home-manager.enable = true;
      home = {
        username = "me";
        homeDirectory = "/home/me";
        stateVersion = "23.05";
        file = {
          ".bash_profile".source = ./cfg/bash_profile;
          ".bashrc".source = ./cfg/bashrc;
          ".gitconfig".source = ./cfg/gitconfig;
          ".tmux.conf".source = ./cfg/tmux.conf;
          ".vimrc".source = ./cfg/vimrc;
          ".zshrc".source = ./cfg/zshrc;
          "${config.xdg.configHome}/ranger/rc.conf".text = ''
            set preview_images_method kitty
          '';
          "${config.xdg.configHome}/zsh/abbr.zsh".source = ./cfg/abbr.zsh;
        };
        sessionVariables = { FLAKE = "/home/me/.nix"; };
        packages = with pkgs; [
          bat
          bitwarden
          btop
          clang
          eza
          dust
          fd
          fzf
          gh
          git
          jq
          kitty
          lazygit
          man
          nix-diff
          nh # nix helper
          nvd # nix version diff tool
          ouch # compression tool
          psmisc # for killall
          ranger
          ripgrep
          starship
          tldr
          tmux
          vim
          wget
          zoxide
        ];
      };
    }
    (lib.mkIf config.my.btrfs.enable { home.packages = [ pkgs.btrfs-progs ]; })
    (lib.mkIf config.my.gpg.enable {
      home.packages = [ pkgs.pinentry ];

      programs.gpg.enable = true;

      services.gpg-agent = {
        enable = true;
        pinentryPackage = lib.mkDefault pkgs.pinentry-curses;
      };
    })
    (lib.mkIf config.my.nvim.enable {
      home.packages = with pkgs; [ neovim gnumake unzip ];
    })
    (lib.mkIf config.my.pass.enable { home.packages = [ pkgs.pass ]; })
    (lib.mkIf config.my.zsh.enable { programs.zsh.enable = true; })
    (lib.mkIf config.my.desktop.enable {
      home = {
        packages = with pkgs; [ firefox gimp transmission-gtk wl-clipboard ];

        file = { ".config/kitty/kitty.conf".source = ./cfg/kitty.conf; };
      };
      programs.browserpass.enable = config.my.pass.enable;
      services.gpg-agent.pinentryPackage = pkgs.pinentry-qt;
    })
  ];
}
