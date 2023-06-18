# How to use this template

1.  Search and replace the phrase `TEMPLATE` and replace with your project name
    (in lowercase with no whitespace).

    ```sh
      sed -i 's/TEMPLATE/project-name/g' flake.nix package.json html/index.html
    ```

2.  Grant `direnv` permission to load `.envrc`. This will use `flake.nix` to
    make `yarn` available in your shell.

    ```sh
     direnv allow
    ```

3.  Installing the packages in `package.json` will install the Typescript
    compiler `tsc`.

    ```sh
     yarn install
    ```

4.  Building the project with `yarn` will compile the Typescript code in `src`
    and copy `css` and `html` into `dist`.

    ```sh
     yarn build
    ```
