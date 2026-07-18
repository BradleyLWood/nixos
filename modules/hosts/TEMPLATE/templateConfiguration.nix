{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.templateConfiguration = {...}: {
    networking = {
      hostName = "TEMPLATE";
    };
  };
}
