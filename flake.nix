{
  description = "Master flake BradleyLWood nix configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    hyprland.url = "github:hyprwm/Hyprland";
    nvim.url = "github:BradleyLWood/nvim";

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inports@{ self, nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (top@{ config, withSystem, moduleWithSystem, ... }: {
    nixosConfigurations = {
        paconix = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hardware-configuration.nix
            ./configuration.nix
          ];
        };
      };
    };
}
