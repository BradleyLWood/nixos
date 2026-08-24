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
      gfxmodeEfi = "1600x1200";
    };
  };

  networking.hostName = "taconix";

  services.custom.keyd.enable = true;
  services.custom.fwupd.enable = true;
  services.custom.greetd.enable = true;
  services.custom.sddm.enable = false;
  services.custom.ssh.enable = true;

  system.custom.desktoputils.enable = true;

  features.custom.bitwarden.enable = true;
  features.custom.calibre.enable = true;
  features.custom.desktop.enable = true;
  features.custom.devtools.enable = true;
  features.custom.gnome.enable = true;
  features.custom.helix.enable = true;
  features.custom.hyprland.enable = true;
  features.custom.obsidian.enable = true;
  features.custom.starship.enable = true;
  features.custom.steam.enable = true;
  features.custom.zsh.enable = true;
  features.custom.yazi.enable = true;
  features.custom.zellij.enable = true;
}
