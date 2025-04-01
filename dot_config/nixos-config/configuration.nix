# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    <home-manager/nixos>
    ./hardware-configuration.nix
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than +10";
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';
  security.polkit.enable = true;
  security.sudo.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.flatpak.enable = true;
  # services.redis = {
  #   enable = true;
  # };
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
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

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
  };

  home-manager.users.art =
    { pkgs, ... }:
    {
      home.stateVersion = "24.11";

      programs.waybar = {
        enable = true;
        systemd.enable = true;
        settings = {
          mainBar = {
            layer = "top";
            position = "top";
            height = 32;
            # "width" = 120; # Закомментировано, как в оригинале

            "modules-left" = [
              "sway/workspaces"
              "sway/mode"
              "custom/media"
            ];
            "modules-center" = [
              "clock"
              "privacy"
            ];
            "modules-right" = [
              "tray"
              "pulseaudio"
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

            "clock" = {
              "format-alt" = "{:%H:%M}";
              "format" = "{:%A, %B %d, %Y (%R)}";
              "tooltip-format" = "<tt><small>{calendar}</small></tt>";
              "calendar" = {
                "mode" = "year";
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
              "bat" = "BAT2";
            };

            "network" = {
              "max-length" = 20;
              "format-wifi" = "{essid}";
              "format-ethernet" = "{ipaddr}/{cidr}";
              "format-linked" = "{ifname} (No IP)";
              "format-disconnected" = "Disconnected ⚠";
              "tooltip-format" = "{essid} {frequency}Hz\n{ifname}: {ipaddr}/{cidr}";
              "on-click" = "foot --class=floating-terminal -e 'nmtui'";
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
              "on-click" = "foot --class=floating-terminal -e 'pulsemixer'";
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
              "on-click" = "kitty --class=floating-terminal -e 'bluetuith'";
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
    };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nixfmt-rfc-style
    vim
    neovim

    grim
    slurp
    wl-clipboard
    mako
    waybar
    gammastep
    swaylock-effects
    bluez-tools # brightnessctl
    # (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    feh
    zip
    lxde.lxsession
    zathura
    onlyoffice-bin

    kdePackages.dolphin
    kdePackages.kio 
    kdePackages.kio-fuse  # for mounting remote filesystems
    kdePackages.kio-extras  # for extra protocols support (sftp, fish, etc.)
    kdePackages.qtwayland  # for Wayland support
    kdePackages.qtsvg  # for SVG icon support
    kdePackages.plasma-integration
    kdePackages.breeze-icons
    shared-mime-info

    qutebrowser
    nekoray
    google-chrome
    telegram-desktop
    obsidian
    (wrapOBS {
      plugins = with obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })

    git
    wget
    bat
    btop
    distrobox
    fasd
    unzip
    lazygit
    lazysql
    neofetch
    eza

    wezterm
    zsh
    oh-my-zsh
    starship
    atuin

    lazydocker
    xorg.xhost
    rainfrog
    gitnr
    jnv 
    jq
    nap
    yamllint
    tailspin

    go
    cargo
    gcc
    clang
    clang-tools
    gnumake
    (python3.withPackages (python-pkgs: with python-pkgs; [
    ]))
    nodejs
    nodePackages.npm
    # ruff
    # pyright
    # marksman
    # nodePackages.typescript-language-server
    # lua-language-server
    # pyright
    # ruff-lsp
    ripgrep

    protobuf
    protoc-gen-go
    protoc-gen-go-grpc

    docker-compose
  ];

  services.gnome.gnome-keyring.enable = true;
  services.atuin.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  # services.gammastep.enable = true;
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  programs.zsh.enable = true;
  programs.starship.enable = true;

  fonts.packages = with pkgs; [
    jetbrains-mono
    # nerd-fonts.jetbrains-mono
    font-awesome
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  virtualisation.docker.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
