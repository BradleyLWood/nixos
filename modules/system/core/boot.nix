{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.bootloader = {
    pkgs,
    lib,
    ...
  }: {
    boot = {
      loader = {
        timeout = 2;
        systemd-boot.enable = false;
        efi = {
          canTouchEfiVariables = true;
        };
        grub = {
	  enable = true
          efiSupport = true;
          device = "nodev";
	  useOSProber = true;
          #theme = pkgs.catppuccin-grub;
        };
      };
      kernelPackages = pkgs.linuxPackages_latest;
    };
  };
}
