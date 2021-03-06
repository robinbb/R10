# R10: Nix Reimagined

R10 is a software build system.

* Declare nestable developer environments.
* Define reproducible builds.
* Deploy software with the 4th generation of package manager.

R10 is implemented with [Nix](https://github.com/nixos/nix).


## Status

_Experimental. R10 is a work in progress._


## Differences From Nix

Nix stores are located at `/nix/store`. R10 stores are located at `/opt/nix`.
This is the default value of `NIX_STORE_DIR`.

Nix non-store state data are within `/nix/var/nix`. R10 non-store state data
are within `/var/nix`. This the default value of `NIX_STATE_DIR`.

Nix log directories reside in `/nix/var/log/nix`. R10 data directories reside
in `/var/log/nix`. This is the default value of `NIX_LOG_DIR`.

R10 code is licensed under the Mozilla Public License Version 2.0.
