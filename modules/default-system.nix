{ pkgs, ... }:

let
  users = import ../secrets/admin.nix;
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
    hashedPassword = users.admin.hashedPassword;
  };
}
