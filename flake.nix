{
  description = "SKONG!!!";

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      args = host: {
        inherit inputs;
        hostName = "${host}";
      };
      makeSystem =
        host:
        nixpkgs.lib.nixosSystem {
          modules = [ ./hosts/${host}/configuration.nix ];
          inherit system;
          specialArgs = args host;
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
          extraSpecialArgs = args host;
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

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
