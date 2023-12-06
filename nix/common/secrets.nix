{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pass
    pinentry
  ];
  programs.gnupg.agent.enable = true;
}
