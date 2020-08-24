{
  description = "Reproducible dev environment flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.03";
    nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      lzf = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ (import ./nixos/lzf/configuration.nix) ];
        specialArgs = { inherit inputs; };
      };
    };

    lzf = self.nixosConfigurations.lzf.config.system.build.toplevel;
  };
}

