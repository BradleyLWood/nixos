{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.paconix = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      desktop
      paconixConfiguration
      nvidiaDrivers
      development
    ];
  };
}
