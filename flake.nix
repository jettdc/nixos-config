{
  description = "jett's nixos-config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";
  };

  outputs =
    {
      self,
      nixpkgs,
      agenix,
      ...
    }:
    {
      nixosConfigurations.mothership = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          agenix.nixosModules.default
          ./hosts/mothership/configuration.nix
        ];
      };
    };
}
