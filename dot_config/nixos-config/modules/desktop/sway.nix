{ config, pkgs, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraSessionCommands = ''
      export QT_QPA_PLATFORMTHEME=qt5ct
    '';
  };

  # Сервисы для поддержки рабочего стола
  services.devmon.enable = true;
  services.udisks2.enable = true;
  services.flatpak.enable = true;
  services.gnome.gnome-keyring.enable = true;
}
