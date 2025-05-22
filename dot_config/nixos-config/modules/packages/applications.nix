{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Браузеры
    qutebrowser
    # (
    google-chrome
    # .override {
    #   commandLineArgs = [
    #     "--enable-features=UseOzonePlatform"
    #     "--ozone-platform=wayland"
    #   ];
    # })

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
    notesnook
    anytype
    zathura

    # Сеть
    networkmanagerapplet
    openconnect
    networkmanager-openconnect

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
