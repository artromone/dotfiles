{ config, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    # driSupport = true;
    # driSupport32Bit = true;  # Если нужна 32-битная поддержка
    extraPackages = with pkgs; [ mesa ];
  };
}
