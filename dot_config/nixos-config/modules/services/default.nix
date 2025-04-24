{ config, pkgs, ... }:

{
  imports = [
    ./docker.nix
  ];

  services.atuin.enable = true;
}
