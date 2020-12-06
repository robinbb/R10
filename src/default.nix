let
  nixpkgs =
    import ./nixpkgs {};
in
  nixpkgs.nix.override {
    name = "r10-nix";
    storeDir = "/rbb-opt-nix";
    stateDir = "/rbb-var-nix";
    confDir = "/rbb-conf";
  }
