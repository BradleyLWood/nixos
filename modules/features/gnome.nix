{config, lib, pkgs, ...}: {
  options.features.custom.gnome.enable = lib.mkEnableOption "Enable Gnome and GDM";
  config = lib.mkIf config.features.custom.gnome.enable {
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    services.gnome.core-apps.enable = false;
    services.gnome.core-developer-tools.enable = false;
    services.gnome.games.enable = true;
    environment.gnome.excludePackages = with pkgs; [gnome-tour gnome-user-docs];
  };
}
