{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.TEMPLATE = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      desktop
      templateConfiguration
      nvidiaDrivers
      development
    ];
  };
}
