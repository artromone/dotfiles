{ config, lib, pkgs, nextmeeting, ... }:

let
  nextmeeting_ = lib.getExe nextmeeting.packages.${pkgs.system}.default;
in
{
  programs.waybar = {
    enable = true;
    # systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        # "width" = 120; # Закомментировано, как в оригинале

        "modules-left" = [
          "sway/workspaces"
          "sway/mode"
          # "custom/media"
        ];
        "modules-center" = [
          "privacy"
          "custom/weather"
          "clock"
          "custom/agenda"
        ];
        "modules-right" = [
          "tray"
          "custom/clipboard"
          "pulseaudio"
          "bluetooth"
          "network"
          "backlight"
          "sway/language"
          "battery"
          "battery#bat2"
        ];

        "sway/workspaces" = {
          "disable-scroll" = true;
          "disable-markup" = false;
          "all-outputs" = true;
          "format" = "{icon}";
        };

        "sway/mode" = {
          "format" = "<span style=\"italic\">{}</span>";
        };

        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "";
            "deactivated" = "";
          };
        };

        "tray" = {
          "icon-size" = 21;
          "spacing" = 10;
        };

        "custom/clipboard": {
          "format"= "📋";
          "interval"= "once";
          "on-click"= "cliphist list | dmenu | cliphist decode | wl-copy";
          "on-click-right"= "cliphist wipe";
        };
        "clock" = {
          "format-alt" = "{:%H:%M}";
          "format" = "{:%A, %B %d, %Y (%R)}";
          "tooltip-format" = "<tt><small>{calendar}</small></tt>";
          "calendar" = {
            "mode" = "month";
            "mode-mon-col" = 3;
            "weeks-pos" = "left";
            "on-scroll" = 1;
            "format" = {
              "months" = "<span color='#ffead3'><b>{}</b></span>";
              "days" = "<span color='#ecc6d9'><b>{}</b></span>";
              "weeks" = "<span color='#99ffdd'><b>W{}</b></span>";
              "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
              "today" = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          "actions" = {
            "on-click-right" = "mode";
            "on-click-forward" = "tz_up";
            "on-click-backward" = "tz_down";
            "on-scroll-up" = "shift_down";
            "on-scroll-down" = "shift_up";
          };
        };

        "sway/language" = {
          "format" = "{}";
          "min-length" = 2;
          "on-click" = "swaymsg 'input * xkb_switch_layout next'";
          "tooltip" = false;
        };

        "cpu" = {
          "format" = "{usage}% ";
        };

        "custom/agenda" = {
          "format" = "{}";
          "exec" = nextmeeting_ + " --max-title-length 30 --waybar";
          "on-click" = nextmeeting_ + " --open-meet-url";
          "interval" = 59;
          "return-type" = "json";
          "tooltip" = true;
        };

        "memory" = {
          "format" = "{}% ";
        };

        "temperature" = {
          # "thermal-zone" = 2;
          # "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input";
          "critical-threshold" = 80;
          # "format-critical" = "{temperatureC}°C ";
          "format" = "{temperatureC}°C ";
        };

        "backlight" = {
          # "device" = "acpi_video1";
          "format" = "{percent}% {icon}";
          "states" = [
            0
            50
          ];
          "format-icons" = [
            ""
            ""
          ];
        };

        "battery" = {
          "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{capacity}% {icon}";
          # "format-good" = ""; # Закомментировано, как в оригинале
          # "format-full" = "";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "battery#bat2" = {
          "bat" = "BAT1";
        };

        "network" = {
          "max-length" = 20;
          "format-wifi" = "{essid}";
          "format-ethernet" = "{ipaddr}/{cidr}";
          "format-linked" = "{ifname} (No IP)";
          "format-disconnected" = "Disconnected ⚠";
          "tooltip-format" = "{essid} {frequency}Hz\n{ifname}: {ipaddr}/{cidr}";
          "on-click" = "exec wezterm start --class=floating_terminal -e 'nmtui'";
          "on-click-right" = "exec nm-connection-editor";
        };

        "pulseaudio" = {
          "format" = "{icon} {volume}% {format_source}";
          "format-bluetooth" = "{icon}: {volume}% :{format_source}";
          "format-bluetooth-muted" = "{icon} {format_source}";
          "format-muted" = "{format_source}";
          "format-source" = " {volume}%";
          "format-source-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [
              ""
              ""
              ""
            ];
          };
          "on-click" = "exec wezterm start --class=floating_terminal -e 'pulsemixer'";
        };

        "bluetooth" = {
          "format" = " {status}";
          "format-connected" = " {device_alias}";
          "format-connected-battery" = " {device_alias} {device_battery_percentage}%";
          # "format-device-preference" = [ "device1" "device2" ]; # Закомментировано, как в оригинале
          "tooltip-format" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          "tooltip-format-connected" =
            "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
          "tooltip-format-enumerate-connected-battery" =
            "{device_alias}\t{device_address}\t{device_battery_percentage}%";
          "on-click" = "exec wezterm start --class=floating_terminal -e 'bluetuith'";
        };

        "custom/weather" = {
          "format" = "{}";
          "tooltip" = true;
          "interval" = 3600;
          "exec" = "wttrbar";
          "return-type" = "json";
          "on-click" = "exec wdg-open https://yandex.ru/pogoda/ru/saint-petersburg/details";
        };

        "custom/media" = {
          "format" = "{icon} {}";
          "return-type" = "json";
          "max-length" = 40;
          "format-icons" = {
            "spotify" = "";
            "default" = "🎜";
          };
          "escape" = true;
          "exec" = "$HOME/.config/waybar/mediaplayer.py 2> /dev/null";
        };

        "privacy" = {
          "icon-spacing" = 4;
          "icon-size" = 18;
          "transition-duration" = 250;
          "modules" = [
            {
              "type" = "screenshare";
              "tooltip" = true;
              "tooltip-icon-size" = 24;
            }
            {
              "type" = "audio-out";
              "tooltip" = true;
              "tooltip-icon-size" = 24;
            }
            {
              "type" = "audio-in";
              "tooltip" = true;
              "tooltip-icon-size" = 24;
            }
          ];
        };
      };
    };
  };
}
