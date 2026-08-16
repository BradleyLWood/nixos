{
  lib,
  config,
  pkgs,
  ...
}: {
  options.features.custom.obsidian.enable = lib.mkEnableOption "Enable obsidian";
  config = lib.mkIf config.features.custom.obsidian.enable {
    environment.systemPackages = with pkgs; [
      obsidian
    ];
  };
}
