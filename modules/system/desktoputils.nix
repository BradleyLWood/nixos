{
  config,
  lib,
  pkgs,
  ...
}: {
  options.system.custom.desktoputils.enable = lib.mkEnableOption "Enable desktop packages";
  config = lib.mkIf config.system.custom.desktoputils.enable {
    environment.systemPackages = with pkgs; [
      grim
      slurp
      swappy
      wl-clipboard
    ];
  };
}
