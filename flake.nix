{
  description = "Master flake nix configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    #hyprland = {
    #  url = "";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

    nvim.url = "github:BradleyLWood/nvim";

    #otter-launcher = {
    #  url = "github:kuokuo123/otter-launcher";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    wrappers.url = "github:BirdeeHub/nix-wrapper-modules";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules);
}
