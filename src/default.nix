# src/default.nix
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

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
      # Bootstrap R10.
      r10-nix
    ] ++ (with nixpkgs; [
      # Build some crucial packages.
      bash
      cacert
      dash
      gcc
      gitMinimal
      mosh
      openssh
      stow
      tmux
      tree
      vim
    ]);
  }
