{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Браузеры
    qutebrowser
    google-chrome

    # Мессенджеры и коммуникация
    telegram-desktop
    remmina

    # Мультимедиа
    vlc
    pulsemixer
    (wrapOBS {
      plugins = with obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })

    # Графические приложения
    krita

    # Офисные приложения
    onlyoffice-bin
    obsidian
    zathura

    # Wayland компоненты
    mako
    waybar
    gammastep
    swaylock-effects

    # Терминалы
    wezterm

    # Шелл и дополнения
    zsh
    oh-my-zsh
    starship
    atuin

    # Другие приложения
    nekoray
    ticktick
    qalculate-qt
    antares

    # KDE/Qt компоненты
    libsForQt5.qt5ct
    libsForQt5.breeze-qt5

    # Системные библиотеки
    libGL
    pkg-config
    cmake
    nvidia-vaapi-driver
    vaapiVdpau
    libva
    libva-utils
    bluez-tools

    # Прочее
    feh
    lxde.lxsession
    home-manager
    wireshark
  ];
}
