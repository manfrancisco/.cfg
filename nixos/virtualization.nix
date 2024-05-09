{ config, lib, pkgs, ... }: {
  options.my.virtualization = lib.my.mkEnableOption false;

  config = lib.mkIf config.my.virtualization.enable {
    virtualisation.libvirtd = {
      enable = true;
      qemu.package = pkgs.qemu_kvm;
    };
    programs.virt-manager.enable = true;

    users.users.me.extraGroups = [ "libvirtd" ];
  };
}
