{
  outputs = { self }: {
    templates = {
      ghc94 = {
        path = ./ghc94;
        description = "Empty GHC 9.4 project";
      };
      ghc96 = {
        path = ./ghc96;
        description = "Empty GHC 9.6 project";
      };
      ghc98 = {
        path = ./ghc98;
        description = "Empty GHC 9.8 project";
      };
      ghc910 = {
        path = ./ghc910;
        description = "Empty GHC 9.10 project";
      };
      ghc912 = {
        path = ./ghc912;
        description = "Empty GHC 9.12 project";
      };
      servant-typescript = {
        path = ./servant-typescript;
        description = "Servant webserver + typescript website";
      };

      default = self.templates.ghc912;
    };
  };
}
