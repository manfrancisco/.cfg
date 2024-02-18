{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.my.server.nextcloud.enable {
    # security.acme = {
    #   acceptTerms = true;
    #   defaults = {
    #     email = "nextcloud@mdorst.net";
    #     dnsProvider = "cloudflare";
    #     # Location of your CLOUDFLARE_DNS_API_TOKEN=<value>
    #     # https://www.freedesktop.org/software/systemd/man/latest/systemd.exec.html#EnvironmentFile=
    #     environmentFile = "PATH";
    #   };
    # };

    services = {
      # nginx.virtualHosts = {
      #   "${config.my.server.nextcloud.domain}" = {
      #     forceSSL = true;
      #     enableACME = true;
      #     # Use DNS Challenge for LetsEncrypt
      #     acmeRoot = null;
      #   };
      # };

      nextcloud = {
        enable = true;
        hostName = config.my.server.nextcloud.domain;
        package = pkgs.nextcloud28;
        # Install and configure the database automatically
        database.createLocally = true;
        # Configure redis caching
        configureRedis = true;
        maxUploadSize = "16G";
        https = true;
        autoUpdateApps.enable = true;
        extraAppsEnable = true;
        config = {
          dbtype = "pgsql";
          adminuser = "admin";
          adminpassFile = config.sops.secrets.nextcloud-admin-pass.path;
        };
        settings = {
          overwriteProtocol = "https";
          defaultPhoneRegion = "US";
        };
        # Suggested by Nextcloud's health check
        phpOptions."opcache.interned_strings_buffer" = "16";
      };
      # Nightly database backups
      postgresqlBackup = {
        enable = true;
        startAt = "*-*-* 01:15:00";
      };
    };
  };
}
