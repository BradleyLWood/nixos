{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.bitwarden.enable = lib.mkEnableOption "Enable Bitwarden cli";
  config = lib.mkIf config.features.custom.bitwarden.enable {
    environment.systemPackages = with pkgs; [bitwarden-cli];
  };
}
