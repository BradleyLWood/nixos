{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.diskutils.enable = lib.mkEnableOption "Enable Disk Utilities";
  config = lib.mkIf config.features.custom.diskutils.enable {
    environment.systemPackages = with pkgs; [
      baobab
      gparted
      dosfstools
      exfatprogs
      ntfs3g
    ];
  };
}
