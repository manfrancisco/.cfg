{ config, lib, pkgs, ... }:
{
  options.my.sh = {
    btrfs.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    gpg.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    nvim.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    pass.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    zsh.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkMerge [
    {
      home = {
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
        sessionVariables = {
          FLAKE="/home/me/.nix";
        };
        packages = with pkgs; [
          bat
          bitwarden
          btop
          clang
          eza
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
    (lib.mkIf config.my.sh.btrfs.enable {
      home.packages = [ pkgs.btrfs-progs ];
    })
    (lib.mkIf config.my.sh.gpg.enable {
      home.packages = [ pkgs.pinentry ];

      programs.gpg.enable = true;

      services.gpg-agent = {
        enable = true;
        pinentryPackage = lib.mkDefault pkgs.pinentry-curses;
      };
    })
    (lib.mkIf config.my.sh.nvim.enable {
      home.packages = with pkgs; [
        neovim
        gnumake
        unzip
      ];
    })
    (lib.mkIf config.my.sh.pass.enable {
      home.packages = [ pkgs.pass ];
    })
    (lib.mkIf config.my.sh.zsh.enable {
      programs.zsh.enable = true;
    })
  ];
}
