{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: {
  options.features.custom.zellij.enable = lib.mkEnableOption "Enable zellij";
  config = lib.mkIf config.features.custom.zellij.enable {
    environment.systemPackages = with pkgs; [
      zellij
      inputs.zjstatus.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
