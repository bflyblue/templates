{
  description = "TEMPLATE";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { self, nixpkgs, ... }:
    let
      supportedSystems = [ "x86_64-linux" ];
      forallSystems = nixpkgs.lib.genAttrs supportedSystems;
      nixpkgsFor = system: import nixpkgs { inherit system; };
      hpkgsFor = pkgs: pkgs.haskell.packages.ghc94;
    in {
      packages = forallSystems (system:
        let
          pkgs = nixpkgsFor system;
          haskellPackages = hpkgsFor pkgs;
        in rec {
          TEMPLATE = haskellPackages.callCabal2nix "TEMPLATE" ./. { };
          default = self.packages.${system}.TEMPLATE;
        });
      devShells = forallSystems (system:
        let
          pkgs = nixpkgsFor system;
          haskellPackages = hpkgsFor pkgs;
          hls = pkgs.haskell-language-server.override { dynamic = true; };
        in {
          TEMPLATE = haskellPackages.shellFor {
            packages = p: [ self.packages.${system}.TEMPLATE ];
            buildInputs = [ haskellPackages.cabal-install hls ];
            withHoogle = true;
          };
          default = self.devShells.${system}.TEMPLATE;
        });
    };
}
