{...}: {
  imports = [
    ./hardware_configuration.nix
    ../../../modules
  ];
  networking.hostName = "paconix";
}
