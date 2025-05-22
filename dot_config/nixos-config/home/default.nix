{ config, pkgs, ... }:

{
  imports = [
    ./gammastep.nix
    ./waybar.nix
    ./sway.nix
    ./terminal.nix
  ];

  home.packages = with pkgs; [
  ];

  home.stateVersion = "24.11";
  services.blueman-applet.enable = true;
  services.network-manager-applet.enable = true;
}
