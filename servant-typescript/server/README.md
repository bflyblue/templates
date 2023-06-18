# How to use this template

1.  Rename the `TEMPLATE.cabal` file, and search and replace the phrase
    `TEMPLATE` and replace with your project name (in lowercase with no
    whitespace).

    ```sh
      mv TEMPLATE.cabal project-name.cabal
      sed -i 's/TEMPLATE/project-name/g' flake.nix *.cabal
    ```

2.  Grant `direnv` permission to load `.envrc`. This will use `flake.nix` to
    make `cabal` available in your shell.

    ```sh
      direnv allow
    ```

3.  Build and run your code during development using `cabal`.

    ```sh
      cabal run
    ```

4.  Build your flake with `nix`.

    ```sh
      nix build
    ```
