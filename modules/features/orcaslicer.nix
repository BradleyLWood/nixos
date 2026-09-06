{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.orcaslicer.enable = lib.mkEnableOption "Enable Slicer";
  config = lib.mkIf config.features.custom.orcaslicer.enable {
    environment.systemPackages = with pkgs; [
      orca-slicer
    ];
  };
}
