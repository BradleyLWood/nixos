{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.template.enable = lib.mkEnableOption "Enable template";
  config = lib.mkIf config.features.custom.template.enable {
    environment.systemPackages = with pkgs; [
      template
    ];
  };
}
