{ lib, ... }: {
  options.my = {
    arch = lib.mkOption {
      type = lib.types.enum [ "x86_64-linux" ];
      default = "x86_64-linux";
    };
    cpu = lib.mkOption {
      type = lib.types.enum [ "amd" "intel" ];
      default = "intel";
    };
  };
}
