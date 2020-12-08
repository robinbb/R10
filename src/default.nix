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
  broken-nixpkgs =
    import ./nixpkgs {};
  r10-nix =
    nixpkgs.nix.override {
      name = "r10-nix";
      storeDir = "/opt/nix";
      stateDir = "/var";
      confDir = "/nonexistent-nix-conf";
    };
  crucial-packages =
    with nixpkgs; [
      bash
      cacert
      dash
      gcc
      gitMinimal
      gnused
      mosh
      nix-prefetch-git
      openssh
      stow
      tmux
      tree
      vim
    ];
  interesting-packages =
    with nixpkgs; [
      awscli
      gnupg
      htop
      ispell
      lsof
      lolcat
      mercurial
      mysql
      nix-generate-from-cpan
      nodejs
      postgresql
      pstree
      ag
      unzip
      wget
      zip
    ];
  broken-packages =
    with broken-nixpkgs; [
      bazel
      cabal2nix
      direnv
      ghc
      git-lfs
      gitAndTools.git-annex
      pinentry
      stack
    ];
in
  nixpkgs.buildEnv {
    name = "r10-env";
    paths = [ r10-nix ]
      ++ crucial-packages
      ++ interesting-packages
      ;
  }
