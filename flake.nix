{
  description = "A very basic flake";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin"; 
      home-manager.url = "github:nix-community/home-manager/release-25.05"; 
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
      darwin.url = "github:lnl7/nix-darwin";
      darwin.inputs.nixpkgs.follows = "nixpkgs"; 
  };

  outputs = { self, nixpkgs, home-manager, darwin }: {

    darwinConfigurations."Mike's Mac" = darwin.lib.darwinSystem {
      system = "x86_64-darwin"; 
      modules = [
        home-manager.darwinModules.home-manager
        ./hosts/YourHostName/default.nix
      ];
  };
}
