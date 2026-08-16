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
      extraPortals = [ 
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
      ];
    };

    programs.waybar = {
      enable = true;
    };

    services.dunst = {
      enable = true;
      settings = {
        global = {
          width = 300;
          height = 300;
          offset = "10x50";
          origin = "top-right";
          transparency = 10;
          frame_color = "#cba6f7";
          font = "Monospace 10";
        };
        urgency_normal = {
          background = "#1e1e2e";
          foreground = "#cdd6f4";
          timeout = 10;
        };
      };
    };

    environment.systemPackages = with pkgs; [
      wofi
      hypridle
      hyprlock
      wlogout
      wpaperd
      hyprcursor
      bibata-cursors
    ];

    environment.sessionVariables = {
      # Specify the directory where NixOS links system icons/cursors
      XDG_DATA_DIRS = ["/run/current-system/sw/share"];

      # Configure both Hyprcursor and legacy XCursor styles
      HYPRCURSOR_THEME = "Bibata-Modern-Ice";
      HYPRCURSOR_SIZE = "24";
      XCURSOR_THEME = "Bibata-Modern-Ice";
      XCURSOR_SIZE = "24";
    };
  };
}
