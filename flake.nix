{
  description = "paconix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nvim.url = "github:BradleyLWood/nvim";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.paconix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ ./configuration.nix ];
    };
  };
}
