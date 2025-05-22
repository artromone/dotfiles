{ config, pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./video.nix
  ];

  services.thermald.enable = true;
  services.upower.enable = true;
  services.auto-cpufreq.enable = true;
}
