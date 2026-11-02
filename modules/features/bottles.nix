{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.bottles.enable = lib.mkEnableOption "Enable bottles";
  config = lib.mkIf config.features.custom.bottles.enable {
    environment.systemPackages = with pkgs; [
      (bottles.override {
        removeWarningPopup = true;
      })
    ];
  };
}
