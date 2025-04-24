{ config, pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./opengl.nix
    ./video.nix
  ];
}
