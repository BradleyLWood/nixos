{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.TEMPLATE.enable = lib.mkEnableOption "Enable TEMPLATE";
  config = lib.mkIf config.features.custom.TEMPLATE.enable {
    environment.systemPackages = with pkgs; [
      TEMPLATE
    ];
  };
}
