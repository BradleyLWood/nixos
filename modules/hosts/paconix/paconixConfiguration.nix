{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.paconixConfiguration = {...}: {
    networking = {
      hostName = "paconix";
    };
  };
}
