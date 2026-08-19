{config, ...}: {
  imports = [
    ./hardware_configuration.nix
    ../../modules
  ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = false;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      efiInstallAsRemovable = true;
    };
  };

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  hardware.nvidia = {
    # Modesetting is required for most modern Wayland compositors (e.g., Hyprland, GNOME)
    modesetting.enable = true;

    # Nvidia power management. Required for suspend/resume.
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = false;

    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  networking.hostName = "paconix";

  services.custom.keyd.enable = true;
  services.custom.fwupd.enable = true;
  services.custom.greetd.enable = true;
  services.custom.sddm.enable = false;
  services.custom.ssh.enable = true;

  system.custom.desktoputils.enable = true;

  features.custom.calibre.enable = true;
  features.custom.desktop.enable = true;
  features.custom.devtools.enable = true;
  features.custom.gnome.enable = false;
  features.custom.helix.enable = true;
  features.custom.hyprland.enable = true;
  features.custom.obsidian.enable = true;
  features.custom.openscad.enable = true;
  features.custom.starship.enable = true;
  features.custom.steam.enable = true;
  features.custom.zsh.enable = true;
  features.custom.yazi.enable = true;
  features.custom.zellij.enable = true;
}
