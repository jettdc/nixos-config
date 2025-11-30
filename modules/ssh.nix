{ config, ... }:

{
  services.openssh = {
    enable = true;
    # TODO(jcrowson): No password, no root. 
    permitRootLogin = "yes";
    passwordAuthentication = true;
  };
  
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
  };
}
