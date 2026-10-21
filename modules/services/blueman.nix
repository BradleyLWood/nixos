{
  config,
  lib,
  ...
}: {
  options.services.custom.blueman.enable = lib.mkEnableOption "Blueman bluetooth service";
  config = lib.mkIf config.services.custom.blueman.enable {
    services.blueman.enable = true;
  };
}
