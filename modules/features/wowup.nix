{
  lib,
  config,
  pkgs,
  ...
}: {
  options.features.custom.wowup.enable = lib.mkEnableOption "Enable wowup";
  config = lib.mkIf config.features.custom.wowup.enable {
    environment.systemPackages = with pkgs; [
      wowup-cf
    ];
  };
}
