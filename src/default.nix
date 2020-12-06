let
  config =
    { checkMeta = true;
      checkMetaRecursively = true;
      doCheckByDefault = true;
    };
  nixpkgs =
    import ./nixpkgs config;
  r10-nix =
    nixpkgs.nix.override {
      name = "r10-nix";
      storeDir = "/opt/nix";
      stateDir = "/var";
      confDir = "/nonexistent-nix-conf";
    };
in
  nixpkgs.buildEnv {
    name = "r10-env";
    paths = [
      r10-nix
      nixpkgs.cacert
    ];
  }
