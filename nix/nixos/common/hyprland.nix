{ lib, pkgs, ... }:
let
  inherit (lib) mkDefault mkOverride;
in {
  hardware = {
    opengl.enable = true;
    # Most wayland compositors need this
    nvidia.modesetting.enable = true;
  };
}
