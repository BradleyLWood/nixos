{...}: {
  imports = [
    ./hardware_configuration.nix
    ../../modules
  ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
    };
  };

  networking.hostName = "taconix";

  services.custom.keyd.enable = true;
  services.custom.sddm.enable = true;
  services.custom.ssh.enable = true;

  features.custom.desktop.enable = true;
  features.custom.devtools.enable = true;
  features.custom.gnome.enable = true;
  features.custom.helix.enable = true;
  features.custom.hyprland.enable = true;
  features.custom.starship.enable = true;
  features.custom.zsh.enable = true;
  features.custom.yazi.enable = true;
}
