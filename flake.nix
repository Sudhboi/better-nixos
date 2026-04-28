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
      userPreferences = {
        terminalEmulator = "kitty";
      };
      args = host: {
        hostName = "${host}";
        windowManager = "niri";
        inherit inputs;
        inherit userPreferences;
      };
      makeSystem =
        host:
        nixpkgs.lib.nixosSystem {
          modules = [ ./nixos/nixos.nix ];
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

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.niri.follows = "nixpkgs";
    };
  };
}
