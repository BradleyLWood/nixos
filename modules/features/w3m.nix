{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.w3m.enable = lib.mkEnableOption "Enable w3m";
  config = lib.mkIf config.features.custom.w3m.enable {
    environment.systemPackages = with pkgs; [
      w3m
    ];
  };
}
