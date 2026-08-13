{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.helix.enable = lib.mkEnableOption "Enable Helix editor";
  config = lib.mkIf config.features.custom.helix.enable {
    environment.systemPackages = [pkgs.helix];
  };
}
