{...}: {
  imports = [
    ./hardware_configuration.nix
    ../../modules
  ];

  networking.hostName = "taconix";

  services.custom.keyd.enable = true;
  services.custom.sddm.enable = true;
  services.custom.ssh.enable = true;
}
