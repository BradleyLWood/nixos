{
  config,
  lib,
  pkgs,
  ...
}: {
  options.services.custom.greetd.enable = lib.mkEnableOption "Enable greetd service";
  config = lib.mkIf config.services.custom.greetd.enable {
    users.users.greeter = {
      isNormalUser = false;
      extraGroups = ["seat" "video"];
    };

    systemd.tmpfiles.rules = [
      "d /var/cache/tuigreet 0700 greeter greeter -"
    ];

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = ''
            ${pkgs.tuigreet}/bin/tuigreet \
              --time \
              --remember \
              --remember-user-session \
              --sessions ${config.services.displayManager.sessionData.desktops}/share/xsessions:${config.services.displayManager.sessionData.desktops}/share/wayland-sessions \
              --user-menu \
              --power-shutdown "systemctl poweroff" \
              --power-reboot "systemctl reboot" \
              --theme "bg=black;fg=white;container=black;border=magenta;text=white;prompt=green;time=cyan;action=yellow;button=magenta;input=white"
          '';
          user = "greeter";
        };
      };
    };
  };
}
