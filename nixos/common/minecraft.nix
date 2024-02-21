{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.my.server.minecraft.vanilla.enable {
    services.minecraft-server = {
      enable = true;
      eula = true;
      dataDir = "/data/Minecraft/Vanilla";
      openFirewall = true;
      declarative = true;
      serverProperties = {
        server-port = 25565;
        difficulty = 3;
        gamemode = 1;
        motd = "Welcome to Minecraft on NixOS!";
      };
    };
  } // lib.mkIf config.my.server.minecraft.atm9.enable {
    services.modded-minecraft-servers = {
      eula = true;
      instances = {
        atm9 = {
          enable = true;
          jvmPackage = pkgs.jdk17;
          serverConfig = {
            server-port = 25565;
            rcon-port = 25566;
            rcon-password = "12345";
            motd = "Welcome to BIG Minecraft";
          };
          rsyncSSHKeys = import ../../common/ssh-keys.nix;
        };
      };
    };
    # users.users.me.extraGroups = [ "mc-atm9" ];
  } // lib.mkIf true {
    # Necessary due to a bug in the modded-minecraft-servers flake.
    services.modded-minecraft-servers = {
      eula = true;
      instances = {};
    };
  };
}
