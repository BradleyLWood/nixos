{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.openscad.enable = lib.mkEnableOption "Enable openscad";
  config = lib.mkIf config.features.custom.openscad.enable {
    environment.systemPackages = with pkgs; [
      openscad
    ];
  };
}
