{
  description = "SysConf2";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    linux-wallpaper-engine.url = "github:jagrat7/linux-wallpaper-engine";
  };
  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        Nya = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./nix/Nya.nix
          ];
          specialArgs = {
            inherit inputs;
          };
        };
        MeoW = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./nix/MeoW.nix
          ];
          specialArgs = {
            inherit inputs;
          };
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
