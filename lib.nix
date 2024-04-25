{ lib, ... }: rec {
  mkBoolOption = default: lib.mkOption {
    type = lib.types.bool;
    inherit default;
  };
  mkEnableOption = default: {
    enable = mkBoolOption default;
  };
}
