{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/core
    ./modules/hardware
    ./modules/desktop
    ./modules/services
    ./modules/packages
  ];

  home-manager.backupFileExtension = "backup";
  # home-manager.useUserPackages = true;
  system.stateVersion = "24.11";
}
