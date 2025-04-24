{ config, pkgs, ... }:

{
  imports = [
    ./sway.nix
    ./fonts.nix
    ./file-management.nix
  ];
}
