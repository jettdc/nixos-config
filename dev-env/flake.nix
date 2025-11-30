{
  description = "Dev environment for working in this repo";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    agenix.url = "github:ryantm/agenix";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      agenix,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            agenix.packages.${system}.agenix
            pkgs.age
            pkgs.vim
          ];

          shellHook = ''
            export EDITOR=vim
            echo "🔐 agenix + age environment ready"
          '';
        };
      }
    );
}
