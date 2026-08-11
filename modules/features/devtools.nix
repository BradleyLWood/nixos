{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options.features.custom.devtools.enable = lib.mkEnableOption "SSH server with hardened defaults";
  config = lib.mkIf config.features.custom.devtools.enable {
    environment.systemPackages = with pkgs; [
      devenv
      gh
      jq
      jujutsu
      lazygit
      inputs.nvim-bw.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
