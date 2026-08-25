{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.neomutt.enable = lib.mkEnableOption "Enable neomutt";
  config = lib.mkIf config.features.custom.neomutt.enable {
    # Define the systemd user service to run mbsync
    systemd.user.services.mbsync = {
      description = "Mailbox synchronization";
      wantedBy = ["default.target"];
      serviceConfig = {
        Type = "oneshot";
        # Runs mbsync for all channels. Adjust flags (-a, -V) as perferred.
        ExecStart = "${pkgs.isync}/bin/mbsync -aq";
      };
    };

    # Define the timer to trigger the service periodically
    systemd.user.timers.mbsync = {
      description = "Mailbox synchronization timer";
      wantedBy = ["timers.target"];
      timerConfig = {
        OnBootSec = "2m"; # Run 2 minutes after boot
        OnUnitActiveSec = "10m"; # Run every 10 minuts thereafter
        Unit = "mbsync.service";
      };
    };

    environment.etc."mailcap".text = ''
      text/html; ${pkgs.w3m}/bin/w3m -I %{charset} -T text/html -dump '%s'; copiousoutput
    '';

    environment.systemPackages = with pkgs; [
      neomutt
      isync
      w3m
      urlscan
    ];
  };
}
