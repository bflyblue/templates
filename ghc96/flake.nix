{
  description = "TEMPLATE";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      supportedSystems = [ "x86_64-linux" ];
      forallSystems =
        f:
        nixpkgs.lib.genAttrs supportedSystems (
          system:
          f (rec {
            inherit system;
            pkgs = nixpkgsFor system;
            haskellPackages = hpkgsFor system pkgs;
          })
        );
      nixpkgsFor = system: import nixpkgs { inherit system; };
      hpkgsFor =
        system: pkgs:
        with pkgs.haskell.lib;
        pkgs.haskell.packages.ghc96.override { overrides = self: super: { }; };
    in
    {
      packages = forallSystems (
        {
          system,
          pkgs,
          haskellPackages,
        }:
        {
          TEMPLATE = haskellPackages.callCabal2nix "TEMPLATE" ./. { };
          default = self.packages.${system}.TEMPLATE;
        }
      );
      devShells = forallSystems (
        {
          system,
          pkgs,
          haskellPackages,
        }:
        {
          TEMPLATE = haskellPackages.shellFor {
            packages = p: [ self.packages.${system}.TEMPLATE ];
            buildInputs = with haskellPackages; [
              cabal-install
              haskell-language-server
            ];
            withHoogle = true;
          };
          default = self.devShells.${system}.TEMPLATE;
        }
      );
    };
}
