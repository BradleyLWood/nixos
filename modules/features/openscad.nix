{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.openscad.enable = lib.mkEnableOption "Enable openscad";
  config = lib.mkIf config.features.custom.opescad.enable {
    environment.systemPackages = with pkgs; [
      openscad
    ];
  };
}
