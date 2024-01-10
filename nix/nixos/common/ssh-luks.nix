{ ... }:
{
  boot = {
    initrd = {
      network = {
        enable = true;
        ssh = {
          enable = true;
          port = 22;
          shell = "/bin/cryptsetup-askpass";
          authorizedKeys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGRZy5DeVFgpAVGG98rYE9goW++AsHIhriELkOAWjuus me@nixos-desktop"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIApAUfrvdzryjaoVwNFB/GRtx0P3n2/FI5AOWBQ8l6Tf me@michael-laptop-arch"
          ];
          # Generate a key with:
          #   ssh-keygen -N "" -f /etc/secrets/initrd/ssh_host_ed25519_key
          hostKeys = [ "/etc/secrets/initrd/ssh_host_ed25519_key" ];
        };
      };
      # Enable your network card during initrd. Find what module your network card needs with:
      #   lspci -v | grep -iA8 'network\|ethernet'
      availableKernelModules = [ "r8169" ];
    };
    # Enable dhcp during boot. Can also be set to a static IP.
    kernelParams = [ "ip=dhcp" ];
  };
}
