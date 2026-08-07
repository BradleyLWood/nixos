{...}: {
  imports = [
    ./hardware_configuration.nix
    ../../modules
  ];

  networking.hostName = "paconix";

  services.custom.keyd.enable = true;
  services.custom.sddm.enable = true;
  services.custom.ssh.enable = true;

  features.custom.desktop.enable = true;
  features.custom.gnome.enable = false;
  features.custom.hyprland.enable = true;
  features.custom.starship.enable = true;
  features.custom.zsh.enable = true;
}
