{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.opencode.enable = lib.mkEnableOption "Enable opencode";
  config = lib.mkIf config.features.custom.opencode.enable {
    environment.systemPackages = with pkgs; [
      opencode
    ];
  };
}
