{
  description = "SysConf2";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    solaar = {
      url = "github:Svenum/Solaar-Flake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    home-manager,
    solaar,
    ...
  }@inputs:{
    nixosConfigurations = {
      Nya = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nix/Nya.nix
        ];
      };
      MeoW = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nix/MeoW.nix
          solaar.nixosModules.default
        ];
      };
    };
    homeConfigurations.Shiruvi = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
      modules = [
        ./home/Shiruvi/home.nix
      ];
    };
  };
}
