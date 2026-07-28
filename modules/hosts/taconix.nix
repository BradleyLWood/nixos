{config, ...}: {
  flake.nixosConfigurations.taconix = config.flake.lib.mkHost {
    hostname = "taconix";
    aspects = [
      "base"
      #"desktop"
      #"networking"
    ];
    extraModules = [
      ../_hardware/taconix.nix
      {system.stateVersion = "26.05";} # Don't change - based on initial system installation.
    ];
  };
}
