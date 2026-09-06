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

  features.custom.bitwarden.enable = true;
  features.custom.calibre.enable = true;
  features.custom.desktop.enable = true;
  features.custom.devtools.enable = true;
  features.custom.gnome.enable = true;
  features.custom.diskutils.enable = false;
  features.custom.helix.enable = true;
  features.custom.hyprland.enable = true;
  features.custom.neomutt.enable = true;
  features.custom.obsidian.enable = true;
  features.custom.openscad.enable = false;
  features.custom.orcaslicer.enable = true;
  features.custom.prismlauncher.enable = false;
  features.custom.printing.enable = true;
  features.custom.starship.enable = true;
  features.custom.steam.enable = true;
  features.custom.yazi.enable = true;
  features.custom.zellij.enable = true;
  features.custom.zsh.enable = true;
  services.custom.fwupd.enable = true;
  services.custom.greetd.enable = true;
  services.custom.keyd.enable = true;
  services.custom.kmscon.enable = true;
  services.custom.lightdm.enable = false;
  services.custom.sddm.enable = false;
  services.custom.ssh.enable = true;
  system.custom.desktoputils.enable = true;
}
