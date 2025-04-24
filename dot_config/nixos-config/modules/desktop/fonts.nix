{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    jetbrains-mono
    # nerd-fonts.jetbrains-mono
    font-awesome
  ];
}
