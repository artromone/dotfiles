{ config, pkgs, ... }:

{
  wayland.windowManager.sway.config.bars = [
    {
      command = "waybar";
    }
  ];
  wayland.windowManager.sway.checkConfig = false;
  wayland.windowManager.sway = {
    enable = true;
    config = {
      # Основные переменные
      modifier = "Mod4";
      terminal = "wezterm";
      menu = "wmenu-run";
      # floating-terminal = "wezterm --class floating-terminal";
      # window.commands = [
      #   {
      #     command = "floating enable";
      #     criteria = {
      #       app_id = "floating-terminal";
      #     };
      #   }
      #   {
      #     command = "floating enable";
      #     criteria = {
      #       class = "floating-terminal";
      #     };
      #   }
      # ];

      # Направления как в vim
      left = "h";
      down = "j";
      up = "k";
      right = "l";

      # Настройка вывода
      output = {
        "*" = {
          bg = "~/pictures/wallpaper.jpg fill";
        };
      };

      # Настройка ввода
      input = {
        "type:keyboard" = {
          xkb_layout = "us,ru";
          xkb_options = "grp:alt_shift_toggle";
          xkb_numlock = "enabled";
        };
        "type:touchpad" = {
          natural_scroll = "enabled";
        };
      };

      # Привязки клавиш
      keybindings =
        let
          modifier = config.wayland.windowManager.sway.config.modifier;
        in
        {
          # Основные
          "${modifier}+Return" = "exec ${config.wayland.windowManager.sway.config.terminal}";
          "${modifier}+Shift+q" = "kill";
          "${modifier}+d" = "exec ${config.wayland.windowManager.sway.config.menu}";
          "${modifier}+Shift+c" = "reload";
          "${modifier}+Space" =
            "exec echo -n | dmenu -p \"TickTick:\" | xargs -0 ticktask && notify-send ticktask -t 1000 sent || notify-send ticktask -u critical -t 2000 \"not sent\"";
          "${modifier}+Shift+e" =
            "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";

          # Перемещение фокуса
          "${modifier}+${config.wayland.windowManager.sway.config.left}" = "focus left";
          "${modifier}+${config.wayland.windowManager.sway.config.down}" = "focus down";
          "${modifier}+${config.wayland.windowManager.sway.config.up}" = "focus up";
          "${modifier}+${config.wayland.windowManager.sway.config.right}" = "focus right";
          "${modifier}+Left" = "focus left";
          "${modifier}+Down" = "focus down";
          "${modifier}+Up" = "focus up";
          "${modifier}+Right" = "focus right";

          # Перемещение окон
          "${modifier}+Shift+${config.wayland.windowManager.sway.config.left}" = "move left";
          "${modifier}+Shift+${config.wayland.windowManager.sway.config.down}" = "move down";
          "${modifier}+Shift+${config.wayland.windowManager.sway.config.up}" = "move up";
          "${modifier}+Shift+${config.wayland.windowManager.sway.config.right}" = "move right";
          "${modifier}+Shift+Left" = "move left";
          "${modifier}+Shift+Down" = "move down";
          "${modifier}+Shift+Up" = "move up";
          "${modifier}+Shift+Right" = "move right";

          # Рабочие пространства
          "${modifier}+1" = "workspace number 1";
          "${modifier}+2" = "workspace number 2";
          "${modifier}+3" = "workspace number 3";
          "${modifier}+4" = "workspace number 4";
          "${modifier}+5" = "workspace number 5";
          "${modifier}+6" = "workspace number 6";
          "${modifier}+7" = "workspace number 7";
          "${modifier}+8" = "workspace number 8";
          "${modifier}+9" = "workspace number 9";
          "${modifier}+0" = "workspace number 0";

          # Перемещение контейнеров между рабочими пространствами
          "${modifier}+Shift+1" = "move container to workspace number 1";
          "${modifier}+Shift+2" = "move container to workspace number 2";
          "${modifier}+Shift+3" = "move container to workspace number 3";
          "${modifier}+Shift+4" = "move container to workspace number 4";
          "${modifier}+Shift+5" = "move container to workspace number 5";
          "${modifier}+Shift+6" = "move container to workspace number 6";
          "${modifier}+Shift+7" = "move container to workspace number 7";
          "${modifier}+Shift+8" = "move container to workspace number 8";
          "${modifier}+Shift+9" = "move container to workspace number 9";
          "${modifier}+Shift+0" = "move container to workspace number 0";

          # Управление компоновкой
          "${modifier}+b" = "splith";
          "${modifier}+v" = "splitv";
          "${modifier}+s" = "layout stacking";
          "${modifier}+w" = "layout tabbed";
          "${modifier}+e" = "layout toggle split";
          "${modifier}+f" = "fullscreen";
          "${modifier}+Shift+space" = "floating toggle";
          # "${modifier}+space" = "focus mode_toggle";
          # "${modifier}+a" = "focus parent";

          # Скратчпад
          "${modifier}+Shift+minus" = "move scratchpad";
          "${modifier}+minus" = "scratchpad show";

          # Режим изменения размера
          "${modifier}+r" = "mode resize";

          # Скриншоты
          "${modifier}+Alt+s" = "exec grim -g \"$(slurp)\" ~/pictures/$(date +'%s_grim.png')";
          "${modifier}+Shift+s" = "exec grim -g \"$(slurp)\" - | swappy -f -";
          "${modifier}+Escape" = "exec swaylock --screenshots --effect-blur 7x5 --effect-vignette 0.5:0.5";

          # Мультимедийные клавиши
          "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
          "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
          "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
          "XF86AudioMicMute" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";
          "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
          "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
          "Print" = "exec grim";

          # Управление мышью с клавиатуры
          "${modifier}+a" = "wl-kbptr -o modes=floating,click -o mode_floating.source=detect";
          "${modifier}+Shift+a" = "mode Mouse";
        };

      # Режимы
      modes = {
        resize = {
          "${config.wayland.windowManager.sway.config.left}" = "resize shrink width 10px";
          "${config.wayland.windowManager.sway.config.down}" = "resize grow height 10px";
          "${config.wayland.windowManager.sway.config.up}" = "resize shrink height 10px";
          "${config.wayland.windowManager.sway.config.right}" = "resize grow width 10px";
          "Left" = "resize shrink width 10px";
          "Down" = "resize grow height 10px";
          "Up" = "resize shrink height 10px";
          "Right" = "resize grow width 10px";
          "Return" = "mode default";
          "Escape" = "mode default";
        };

        # Режим управления мышью
        Mouse = {
          "a" = "mode default, exec 'wl-kbptr-sway-active-win; swaymsg mode Mouse'";
          "Shift+a" = "mode default, exec 'wl-kbptr; swaymsg mode Mouse'";

          # Перемещение курсора
          "h" = "seat seat0 cursor move -15 0";
          "j" = "seat seat0 cursor move 0 15";
          "k" = "seat seat0 cursor move 0 -15";
          "l" = "seat seat0 cursor move 15 0";

          # Левая кнопка мыши
          "s" = "seat seat0 cursor press button1";
          "--release s" = "seat seat0 cursor release button1";

          # Средняя кнопка мыши
          "d" = "seat seat0 cursor press button2";
          "--release d" = "seat seat0 cursor release button2";

          # Правая кнопка мыши
          "f" = "seat seat0 cursor press button3";
          "--release f" = "seat seat0 cursor release button3";

          "Escape" = "mode default";
        };
      };

      # Настройки окон
      fonts = {
        names = [ "JetbrainsMono Nerd Font" ];
        size = 12.0;
      };

      window = {
        border = 1;
        hideEdgeBorders = "none";
      };

      floating = {
        border = 0;
      };

      gaps = {
        inner = 15;
        smartGaps = true;
      };

      # Автозапуск
      startup = [
        { command = "lxpolkit &"; }
      ];
    };

    # Дополнительные настройки
    extraConfig = ''
      # Дополнительные настройки, которые сложно выразить через Nix
      # Например, специфичные для Sway команды или сложные условия
    '';

    # Включаем Sway
    wrapperFeatures = {
      gtk = true; # Для корректной работы GTK приложений
    };
  };

  # Устанавливаем необходимые пакеты
  home.packages = with pkgs; [
    grim # Утилита для скриншотов
    slurp # Утилита для выбора области экрана
    swappy # Редактор скриншотов
    wl-clipboard # Буфер обмена для Wayland
    brightnessctl # Управление яркостью
    lxsession # Для lxpolkit
    # swaylock # Блокировка экрана
    swaylock-effects
    wl-kbptr
    libnotify
    dmenu
  ];
}
