{
  description = "paconix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, nvf, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      myNeovim = nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [
          {
            config.vim = {
              viAlias = true;
              vimAlias = true;
              
              treesitter.enable = true;
              #telescope.enable = true;

              theme = {
                enable = true;
                name = "catppuccin";
                style = "mocha";
                transparent = true;
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
          ({ pkgs, ... }: {
            environment.systemPackages = [
              myNeovim.neovim
            ];
          })
        ];
      };
    };
}
