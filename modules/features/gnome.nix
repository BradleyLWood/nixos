{
  config,
  lib,
  pkgs,
  ...
}: {
  options.features.custom.gnome.enable = lib.mkEnableOption "Enable Gnome and GDM";
  config = lib.mkIf config.features.custom.gnome.enable {
    services.desktopManager.gnome.enable = true;

    services.gnome.core-apps.enable = true;
    services.gnome.core-developer-tools.enable = false;
    services.gnome.games.enable = true;

    environment.gnome.excludePackages = with pkgs; [gnome-tour gnome-user-docs];
    environment.systemPackages = with pkgs; [
      gnome-tweaks
      gnomeExtensions.blur-my-shell
      gnomeExtensions.just-perfection
      drawing
      xournalpp
    ];
  };
}
