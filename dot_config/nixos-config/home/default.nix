{ config, pkgs, ... }:

{
  imports = [
    ./gammastep.nix
    ./waybar.nix
    ./sway.nix
    ./terminal.nix
  ];

  home.stateVersion = "24.11";
  services.blueman-applet.enable = true;
  services.network-manager-applet.enable = true;
}
