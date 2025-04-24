{ config, pkgs, ... }:

{
  services.gammastep = {
    enable = true;
    
    temperature = {
      day = 5000;
      night = 3000;
    };
    
    settings = {
      general = {
        fade = 1;
        gamma = 1.0;
        adjustment-method = "wayland";
      };
    };
    
    provider = "manual";
    latitude = 60.0;
    longitude = 30.0;
    
    tray = true;
  };
  
  home.packages = with pkgs; [
  ];
  
  services.status-notifier-watcher.enable = true;
}

