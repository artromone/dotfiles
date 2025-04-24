{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Языки программирования и инструменты разработки
    go
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
  ];
}
