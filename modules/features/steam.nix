{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.steam.enable = lib.mkEnableOption "Enable steam";
  config = lib.mkIf config.features.custom.steam.enable {
    programs.steam.enable = true;
    programs.gamemode.enable = true;
  };
}
