{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.printing.enable = lib.mkEnableOption "Enable printers";
  config = lib.mkIf config.features.custom.printing.enable {
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    services.printing = {
      enable = true;
      drivers = with pkgs; [
        cups-filters
        cups-browsed
        brlaser
      ];
    };
  };
}
