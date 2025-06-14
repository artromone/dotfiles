{ config, pkgs, ... }:

{
  virtualisation.waydroid.enable = true;

  environment.systemPackages = with pkgs; [
    # Языки программирования
    go
    golangci-lint
    (go-migrate.overrideAttrs (oldAttrs: {
      tags = [ "postgres" ];
    }))
    go-mockery
    cargo
    gcc
    clang
    clang-tools
    gnumake
    (python3.withPackages (python-pkgs: with python-pkgs; [ ]))
    nodejs
    nodePackages.npm
    sqlc

    # Инструменты разработки
    git
    ripgrep
    protobuf
    protoc-gen-go
    protoc-gen-go-grpc
    postman

    # Редакторы
    vim
    neovim

    # Форматирование
    nixfmt-rfc-style

    # Работа
    envsubst
  ];
}

