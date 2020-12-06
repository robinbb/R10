let
  config = {
    checkMeta = true;
    checkMetaRecursively = true;
    doCheckByDefault = true;
  };
  nixpkgs =
    import ./nixpkgs config;
in
  nixpkgs.nix.override {
    name = "r10-nix";
    storeDir = "/opt/nix";
    stateDir = "/var";
    confDir = "/nonexistent-nix-conf";
  }
