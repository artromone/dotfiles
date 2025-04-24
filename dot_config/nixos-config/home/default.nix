{ config, pkgs, ... }:

{
  imports = [
    ./gammastep.nix
    ./waybar.nix
    ./sway.nix
    ./terminal.nix
  ];

  home.stateVersion = "24.11";
}
