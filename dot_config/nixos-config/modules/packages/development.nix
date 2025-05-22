{ config, pkgs, ... }:

{
  services.zabbixAgent.enable = true;
  services.zabbixAgent.openFirewall = true;
  services.zabbixAgent.server = "0000monwplook01.mts.ru";

  environment.systemPackages = with pkgs; [
    # Языки программирования
    go
    golangci-lint
    go-migrate
    cargo
    gcc
    clang
    clang-tools
    gnumake
    (python3.withPackages (python-pkgs: with python-pkgs; [ ]))
    nodejs
    nodePackages.npm

    # Инструменты разработки
    git
    ripgrep
    protobuf
    protoc-gen-go
    protoc-gen-go-grpc

    # Редакторы
    vim
    neovim

    # Форматирование
    nixfmt-rfc-style

    # Работа
    citrix_workspace
    zabbix.agent
    envsubst
  ];
}

