{ config, pkgs, ... }:

{
  imports = [
    ./development.nix
    ./utilities.nix
    ./applications.nix
  ];

  programs.zsh.enable = true;
  programs.starship.enable = true;

  programs.nix-ld = {
    enable = true;
    libraries = [ ];
  };
}
