{...}: {
  imports = [
    ../_hardware_configuration.nix
  ];

  hostname = "taconix";
  extraModules = [
    {system.stateVersion = "26.05";} # Don't change - based on initial system installation.
  ];
}
