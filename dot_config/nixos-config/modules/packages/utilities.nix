{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Терминальные утилиты
    bat
    btop
    distrobox
    fasd
    tldr
    unzip
    lazygit
    lazysql
    neofetch
    eza
    lazydocker
    jnv
    jq
    nap
    yamllint
    tailspin
    gcalcli

    # Системные утилиты
    wget
    zip
    unzip
    p7zip
    xarchiver
    gzip
    bzip2
    docker-compose
    auto-cpufreq

    # Wayland утилиты
    grim
    slurp
    wf-recorder
    wl-screenrec
    swappy
    wl-clipboard
    cliphist

    # Прочие утилиты
    xorg.xhost
    rainfrog
    gitnr
    wttrbar
    chezmoi
    bluetuith
    upower
  ];
}
