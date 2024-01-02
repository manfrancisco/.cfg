{ ... }:
{
  home.file.".gnupg/gpg-agent.conf".text = ''
    default-cache-ttl 604800
    max-cache-ttl 604800
  '';
}
