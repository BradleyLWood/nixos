{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.desktop.enable = lib.mkEnableOption "Enable desktop packages";
  config = lib.mkIf config.features.custom.desktop.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.fira-code
    ];

    services.libinput = {
      enable = true;
      touchpad.naturalScrolling = true;
    };

    environment.systemPackages = with pkgs; [
      kitty
      ghostty
      google-chrome
      brightnessctl
    ];
  };
}
