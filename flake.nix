{
  description = "Master flake nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvim-overlay.url = "github:BradleyLWood/nvim";

    herdr = {
      url = "github:ogulcancelik/herdr/v0.7.5";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    otter-launcher = {
      url = "github:kuokuo123/otter-launcher";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations.paconix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      speciatlArgs = {inherit inputs;};
      modules = [
        ./modules/hosts/paconix
      ];
    };
    nixosConfigurations.taconix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      speciatlArgs = {inherit inputs;};
      modules = [
        ./modules/hosts/taconix
      ];
    };
  };
}
