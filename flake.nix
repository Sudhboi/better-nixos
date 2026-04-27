{
  description = "SKONG!!!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      makeSystem =
        host:
        nixpkgs.lib.nixosSystem {
          modules = [ ./hosts/${host}/configuration.nix ];
          inherit system;
          specialArgs = { inherit inputs; };
        };
      makeUser =
        host:
        home-manager.lib.homeManagerConfiguration {
          modules = [
            {
              imports = [ ./home/sudhirk.nix ];
            }
          ];
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = {
            inherit inputs;
            config.host.${host} = true;
          };
        };
      makeConfig = func: {
        "hornet" = func "hornet";
        "knight" = func "knight";
      };
    in
    {
      nixosConfigurations = makeConfig makeSystem;
      homeConfigurations = makeConfig makeUser;
    };
}
