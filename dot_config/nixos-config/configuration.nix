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

  security.pki.certificateFiles = [
    # "/etc/nixos/certs/class2root.crt"
    # "/etc/nixos/certs/WinCAG2.crt"
  ];

  # xdg.portal = {
  #   enable = true;
  #   wlr.enable = true;
  #   # gtk.enable = false;
  # };

  home-manager.backupFileExtension = "backup";
  # home-manager.useUserPackages = true;
  system.stateVersion = "24.11";
}
