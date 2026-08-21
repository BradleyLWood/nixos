{
  config,
  lib,
  pkgs,
  ...
}: {
  options.services.custom.kmscon.enable = lib.mkEnableOption "Enable kmscon";
  config = lib.mkIf config.services.custom.kmscon.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.fira-code
    ];

    console.enable = false;

    services.kmscon = {
      enable = true;
      hwRender = true;
      useXkbConfig = true;

      extraConfig = ''
        font-name = "FiraCode Nerd Font";
        font-size = 14;

        # Catppuccin Mocha Color Palette Configuration
        palette-black=0x1E1E2E
        palette-red=0xF38BA8
        palette-green=0xA6E3A1
        palette-yellow=0xF9E2AF
        palette-blue=0x89B4FA
        palette-magenta=0xF5C2E7
        palette-cyan=0x94E2D5
        palette-white=0xBAC2DE

        # Bright colors
        palette-bright-black=0x585B70
        palette-bright-red=0xF38BA8
        palette-bright-green=0xA6E3A1
        palette-bright-yellow=0xF9E2AF
        palette-bright-blue=0x89B4FA
        palette-bright-magenta=0xF5C2E7
        palette-cyan-bright=0x94E2D5
        palette-white-bright=0xA6ADC8
      '';
    };
  };
}
