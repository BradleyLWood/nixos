{
  config,
  lib,
  pkgs,
  ...
}: {
  options.services.custom.lightdm.enable = lib.mkEnableOption "Enable lightdm";
  config = lib.mkIf config.services.custom.lightdm.enable {
    services.xserver.enable = true;
    services.xserver.displayManager.lightdm = {
      enable = true;
      greeters.gtk.enable = true;
      background = "#1e1e2e";
    };
  };
}
