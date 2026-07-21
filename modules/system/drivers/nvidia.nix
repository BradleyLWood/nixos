{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.nvidiaDrivers = {
    pkgs,
    lib,
    config,
    ...
  }: {
    # Enable OpenGL
    hardware.graphics = {
      enable = true;
    };
    # Load nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      # Modesetting is required for most modern Wayland compositors (e.g., Hyprland, GNOME)
      modesetting.enable = true;

      # Nvidia power management. Required for suspend/resume.
      powerManagement.enable = false;
      powerManagement.finegrained = false;

      open = false;

      package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    };
  };
}
