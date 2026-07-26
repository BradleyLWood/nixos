{config, ...}: {
  flake.nixosConfigurations.paconix = config.flake.lib.mkHost {
    hostname = "paconix";
    aspects = [
      "base"
      #"desktop"
      #"networking"
    ];
    extraModules = [
      ../_hardware/paconix.nix
      {system.stateVersion = "26.05";} # Don't change - based on initial system installation.
    ];
  };
}
