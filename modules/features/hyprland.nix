{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.hyprland.enable = lib.mkEnableOption "Enable Hyprland";
  config = lib.mkIf config.features.custom.hyprland.enable {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-hyprland];
    };

    programs.waybar = {
      enable = true;
    };
    environment.systemPackages = with pkgs; [
      wofi
      hypridle
      hyprlock
      wlogout
      wpaperd
    ];
  };
}
