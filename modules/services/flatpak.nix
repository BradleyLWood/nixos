{
  lib,
  config,
  pkgs,
  ...
}: {
  options.services.custom.flatpak.enable = lib.mkEnableOption "Enable flatpak";
  config = lib.mkIf config.services.custom.flatpak.enable {
      services.flatpak.enable = true;
  };
}
