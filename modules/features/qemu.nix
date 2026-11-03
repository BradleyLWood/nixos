{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.qemu.enable = lib.mkEnableOption "Enable qemu";
  config = lib.mkIf config.features.custom.qemu.enable {
    environment.systemPackages = with pkgs; [
      qemu
    ];
  };
}
