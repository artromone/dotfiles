{ config, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./networking.nix
    ./nix.nix
    ./locale.nix
    ./users.nix
  ];
}
