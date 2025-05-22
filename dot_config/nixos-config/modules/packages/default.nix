{ config, pkgs, ... }:

{
  imports = [
    ./development.nix
    ./utilities.nix
    ./applications.nix
  ];

  # nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  programs.starship.enable = true;

  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

  programs.nix-ld = {
    enable = true;
    libraries = [ ];
  };
}
