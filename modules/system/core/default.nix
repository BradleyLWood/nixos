{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.core = {
    pkgs,
    lib,
    ...
  }: let
    modules = with self.nixosModules; [
      user
      bootloader
      nix
      hardware
      locale
    ];
  in {
    imports =
      [
        /etc/nixos/hardware-configuration.nix
      ]
      ++ modules;

    services.avahi.enable = true;

    services.openssh ={
      enable = true;
      openFirewall = true;
      settings = {
        PasswordAuthentication = true;
        PermitRootLogin = "no";
        MaxAuthTries = 3;
      };
      ports = [ 2270 ];
    };

    services.keyd = {
      enable = true;
      keyboards.default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "escape";
            escape = "capslock";
          };
        };
      };
    };

    environment.systemPackages = with pkgs; [
      vim
      unzip
      p7zip-rar
      usbutils
      lsof
      libnotify
      python315
      curlWithGnuTls
      wget
    ];

    system.stateVersion = "26.05";
  };
}
