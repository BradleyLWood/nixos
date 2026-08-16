{
  lib,
  config,
  pkgs,
  ...
}: {
  options.features.custom.calibre.enable = lib.mkEnableOption "Enable calibre";
  config = lib.mkIf config.features.custom.calibre.enable {
    environment.systemPackages = with pkgs; [
      calibre
    ];
  };
}
