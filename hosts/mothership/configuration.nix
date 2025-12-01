{
  config,
  lib,
  pkgs,
  agenix,
  ...
}:

let
  networkingModule = import ../../modules/networking.nix {
    inherit config pkgs lib;
    hostName = "mothership";
  };
in
{
  age.secrets.secrets.file = ../../secrets/secrets.age;

  imports = [
    ./hardware-configuration.nix
    networkingModule
    ../../modules/ssh.nix
    ../../modules/default-dev-environment.nix
    ../../modules/default-system.nix
  ];

  system.stateVersion = "25.05";

  boot = {
    loader = {
      # Use the systemd-boot EFI boot loader.
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      grub.device = "nvme0n1";
    };
  };
}
