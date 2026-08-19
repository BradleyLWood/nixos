{
  config,
  lib,
  ...
}: {
  options.services.custom.fwupd.enable = lib.mkEnableOption "Firmware updater";
  config = lib.mkIf config.services.custom.fwupd.enable {
    services.fwupd = {
      enable = true;
    };
  };
}
