{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.zellij.enable = lib.mkEnableOption "Enable zellij";
  config = lib.mkIf config.features.custom.zellij.enable {
    environment.systemPackages = with pkgs; [
      zellij
    ];
  };
}
