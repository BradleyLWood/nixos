{...}: {
  imports = [
    ./hardware_configuration.nix
    ../../modules
  ];

  networking.hostName = "taconix";

  services.custom.keyd.enable = true;
  services.custom.sddm.enable = false; # SDDM is incompatible with gnome (I think) TODO move sddm to hyprland feature
  services.custom.ssh.enable = true;

  features.custom.gnome.enable = true;
}
