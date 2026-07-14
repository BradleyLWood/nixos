{
  description = "NixOS configuration with nvf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, nvf, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      # Build your custom neovim configuration using nvf's module system
      myNeovim = nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [
          {
            config.vim = {
              # Enable basic features and plugins
              viAlias = true;
              vimAlias = true;
              
              # Example: Enable TreeSitter and Telescope
              treesitter.enable = true;
              telescope.enable = true;

              # Example: Set a colorscheme
              theme = {
                enable = true;
                name = "onedark";
              };
            };
          }
        ];
      };
    in
    {
      packages.${system}.default = myNeovim.neovim;

      nixosConfigurations.paconix = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
        ];
      };
    };
}
