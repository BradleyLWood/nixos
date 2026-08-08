{
  config,
  lib,
  pkgs,
  ...
}: let
  sddm.enable = lib.mkEnableOption "SDDM login";
  sddm-astronaut =
    (pkgs.sddm-astronaut.override {
      embeddedTheme = "black_hole";
      themeConfig = {
        #HeaderTextColor = "#d5c4a1";
        #Background = "Backgrounds/your-custom-background.png";
        # ... other theme configuration options
      };
    }).overrideAttrs (oldAttrs: {
      # Optional: Inject custom background image
      #installPhase =
      #  oldAttrs.installPhase
      #  + ''
      #    chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
      #    cp ${./relative/path/to/your-custom-background.png} \
      #      $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/your-custom-background.png
      #  '';
    });
in {
  options.services.custom.sddm.enable = sddm.enable;
  config = lib.mkIf config.services.custom.sddm.enable {
    environment.systemPackages = [sddm-astronaut];

    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      enableHidpi = true;
      settings = {
        Users = {
          RememberLastSession = true;
          RememberLastUser = true;
        };
        General = {
          GreeterEnvironment = "QT_SCREEN_SCALE_FACTORS=2, QT_FONT_DPI=192";
        };
        X11 = {
          ServerArguments = "-nolisten tcp -dpi 192";
        };
      };
      package = pkgs.kdePackages.sddm;
      extraPackages = with pkgs; [
        kdePackages.qtmultimedia # Required for video backgrounds/audio
      ];
      theme = "sddm-astronaut-theme";
    };
  };
}
