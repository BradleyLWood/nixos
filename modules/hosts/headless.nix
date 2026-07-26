{config, ...}: {
  flake.nixosConfigurations.headless = config.flake.lib.mkHost {
    hostname = "headless-server";
    aspects = ["base" "networking"];
    extraModules = [
      {system.stateVersion = "26.05";} # Don't change - based on initial system installation.
    ];
  };
}
