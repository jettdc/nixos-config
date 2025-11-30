{ config, lib, pkgs, ... }:

let
  networkingModule = import ../../modules/networking.nix { hostName = "mothership"; };
in
{
  imports =
    [
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
    }
  };
}
