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
          authorizedKeys = import ../common/ssh-keys.nix;
          # Generate a key with:
          #   ssh-keygen -N "" -f /etc/secrets/initrd/ssh_host_ed25519_key
          hostKeys = [ "/etc/secrets/initrd/ssh_host_ed25519_key" ];
        };
      };
      # Enable your network card during initrd. Find what module your network card needs with:
      #   lspci -v | grep -iA8 'network\|ethernet'
      availableKernelModules = [ "r8169" ];
    };
    # Enable DHCP during boot. If using NetworkManager, there may be an issue where internet does
    # not work after booting. To fix this, run
    #   nmcli
    # Make note of the active device and conneciton name.
    # Replace `enp8s0` and `Wired connection 1` below as appropriate.
    #   nmcli con down enp8s0
    #   nmcli con mod "Wired connection 1" connection.interface-name enp8s0
    #   nmcli con up "Wired connection 1"
    # If still not working, try toggling `autoconnect`.
    #   nmcli con mod "Wired connection 1" connection.autoconnect yes
    kernelParams = [ "ip=dhcp" ];
  };
  # Without this, NetworkManager will start the wrong connection at boot.
  networking.interfaces.enp8s0.useDHCP = true;
}
