{
  config,
  pkgs,
  lib,
  hostName,
  ...
}:

let
  secrets = import (config.age.secrets.secrets.path);
in
{
  networking = {
    hostName = hostName;
    wireless = {
      enable = true;
      networks = {
        "${secrets.wifi.ssid}".psk = secrets.wifi.psk;
      };
    };
  };

  networking.firewall.enable = true;
}
