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
              --sessions ${config.services.displayManager.sessionData.desktops}/share/xsessions:${config.services.displayManager.sessionData.desktops}/share/wayland-sessions \
              --remember \
              --remember-user-session \
              --user-menu \
              --power-shutdown "systemctl poweroff" \
              --power-reboot "systemctl reboot"
          '';
          user = "greeter";
        };
      };
    };
  };
}
