{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.prismlauncher.enable = lib.mkEnableOption "Enable prism launcher and jdk";
  config = lib.mkIf config.features.custom.prismlauncher.enable {
    environment.systemPackages = with pkgs; [
      (prismlauncher.override {
        additionalPrograms = [ffmpeg];
        jdks = [
          graalvmPackages.graalvm-ce
          zulu8
          zulu17
          zulu21
          zulu
        ];
      })
    ];
  };
}
