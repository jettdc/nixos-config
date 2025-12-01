{ config, pkgs, ... }:

let
  secrets = import (config.age.secrets.secrets.path);
in
{
  time.timeZone = "America/Denver";
  services.xserver.xkb.layout = "us";

  users.users.admin = {
    isNormalUser = true;
    description = "Admin";
    extraGroups = [ "wheel" ];
    shell = pkgs.bash;
    home = "/home/admin";
    hashedPassword = secrets.users.admin.hashedPassword;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
