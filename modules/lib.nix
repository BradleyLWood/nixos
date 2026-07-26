{
  inputs,
  config,
  ...
}: {
  flake.lib.mkHost = {
    hostname,
    system ? "x86_64-linux",
    aspects ? [],
    extraModules ? [],
  }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules =
        [{networking.hostName = hostname;}]
        ++ map (name: config.flake.modules.nixos.${name}) aspects
        ++ extraModules;
    };
}
