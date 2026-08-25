{
  lib,
  config,
  pkgs,
  ...
}: {
  options.features.custom.yazi.enable = lib.mkEnableOption "Enable yazi";
  config = lib.mkIf config.features.custom.yazi.enable {
    environment.systemPackages = with pkgs; [
      ffmpeg
      fzf
      imagemagick
      jq
      poppler
      rclone
      resvg
      ripgrep
      wl-clipboard
      yazi
      zoxide
    ];
  };
}
