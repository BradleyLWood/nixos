{
  lib,
  config,
  pkgs,
  ...
}: {
  options.features.custom.yazi.enable = lib.mkEnableOption "Enable yazi";
  config = lib.mkIf config.features.custom.yazi.enable {
    environment.systemPackages = with pkgs; [
      yazi
      ffmpeg
      jq
      poppler
      ripgrep
      fzf
      zoxide
      resvg
      imagemagick
      wl-clipboard
    ];
  };
}
