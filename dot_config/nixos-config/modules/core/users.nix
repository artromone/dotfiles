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

  systemd.timers."gcalcli-reminder" = {
  wantedBy = [ "timers.target" ];
  timerConfig = {
    OnBootSec = "5m";
    OnUnitActiveSec = "5m";
    Unit = "gcalcli-reminder.service";
  };
};

systemd.services."gcalcli-reminder" = {
  script = ''
    set -eu
    ${pkgs.gcalcli}/bin/gcalcli remind 15
  '';
  serviceConfig = {
    Type = "oneshot";
    User = "art";
  };
};
}
