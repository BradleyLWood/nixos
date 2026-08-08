{
  inputs,
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

    programs.gdk-pixbuf.modulePackages = [pkgs.librsvg];

    environment.systemPackages = with pkgs; [
      kitty
      ghostty
      inputs.otter-launcher.packages.${pkgs.stdenv.hostPlatform.system}.default
      google-chrome
      brightnessctl
    ];
  };
}
