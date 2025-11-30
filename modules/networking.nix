{ hostName, config, ... }:

let
  wifiFile = ../secrets/wifi.nix;
  wifi =
    if builtins.pathExists wifiFile then
      import wifiFile
    else
      builtins.trace "⚠️ Warning: secrets/wifi.nix not found, wireless will not be configured" null;
in
{
  networking = {
    hostName = hostName;
    wireless =
      if wifi != null then
        {
          enable = true;
          networks = {
            "${wifi.ssid}".psk = wifi.psk;
          };
        }
      else
        { };
  };

  networking.firewall = {
    enable = true;
  };
}
