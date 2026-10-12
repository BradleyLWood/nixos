{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.faugus.enable = lib.mkEnableOption "Enable faugus launcher";
  config = lib.mkIf config.features.custom.faugus.enable {
    environment.systemPackages = with pkgs; [faugus-launcher];
  };
}
