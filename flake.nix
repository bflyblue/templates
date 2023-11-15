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
      servant-typescript = {
        path = ./servant-typescript;
        description = "Servant webserver + typescript website";
      };

      default = self.templates.ghc94;
    };
  };
}
