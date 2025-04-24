{ config, pkgs, ... }:

{
  # Определение учетной записи пользователя
  users.users.art = {
    isNormalUser = true;
    description = "Artem Romanovich";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    packages = with pkgs; [ ];
  };

  users.defaultUserShell = pkgs.zsh;
}
