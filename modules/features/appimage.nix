{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.appimage.enable = lib.mkEnableOption "Enable appimage";
  config = lib.mkIf config.features.custom.appimage.enable {
    environment.systemPackages = with pkgs; [
      appimage-run
    ];
  };
}
