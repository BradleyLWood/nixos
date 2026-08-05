{
  config,
  lib,
  ...
}: {
  options.services.custom.sddm.enable = lib.mkEnableOption "SDDM login";
  config = lib.mkIf config.services.custom.sddm.enable {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };
}
