{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pass
    pinentry
  ];

  programs = {
    browserpass.enable = true;
    gnupg.agent.enable = true;
  };
}
