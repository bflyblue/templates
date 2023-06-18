{
  description = "TEMPLATE";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs"; };

  outputs = { self, nixpkgs, ... }:
    let
      supportedSystems = [ "x86_64-linux" ];
      forallSystems = nixpkgs.lib.genAttrs supportedSystems;
      nixpkgsFor = system: import nixpkgs { inherit system; };
    in {
      packages = forallSystems (system: let pkgs = nixpkgsFor system; in { });
      devShells = forallSystems (system:
        let pkgs = nixpkgsFor system;
        in {
          default = pkgs.mkShell { nativeBuildInputs = with pkgs; [ yarn ]; };
        });
    };
}
