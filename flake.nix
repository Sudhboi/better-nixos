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
      args = { inherit inputs; };
      makeSystem =
        host:
        nixpkgs.lib.nixosSystem {
          modules = [ ./hosts/${host}/configuration.nix ];
          inherit system;
          specialArgs = args;
        };
      makeUser =
        host:
        home-manager.lib.homeManagerConfiguration {
          modules = [
            ./hosts/${host}/home.nix
            { home.hostname = "${host}"; }
          ];
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = args;
        };
      makeConfig = prefix: func: {
        "${prefix}hornet" = func "hornet";
        "${prefix}knight" = func "knight";
      };
    in
    {
      nixosConfigurations = makeConfig "" makeSystem;
      homeConfigurations = makeConfig "sudhirk@" makeUser;
    };
}
