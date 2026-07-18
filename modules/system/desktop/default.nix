{
  self,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.desktop = moduleWithSystem ({...}: let
    modules = with self.nixosModules; [
      core
      hyprland
      sddm
      network
    ];
  in {
    imports = modules;
  });
}
