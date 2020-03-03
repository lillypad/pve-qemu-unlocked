# pve-qemu-unlocked

Proxmox does not support anything other than `x86`/`x86_x64` even though `qemu` which is in it's backend supports to emulate MANY other CPU architectures.

Unfortunately they have decided to disable these features in their own build of qemu.

Since I felt this is a disservice to proxmox and qemu as great technologies, I've decided to start fixing it.

This `Dockerfile` and `make` script will build your own version of `pve-qemu` and remove the `--target-list` configure options enabling all supported CPUs and emulations for the proxmox `pve-qemu` DEB package.

Since this is done with docker you need not worry about any other dependancies other than docker to build the DEB packages you need.

# Features to Come
- Setup Travis CI to serve builds to everyone without having to compile their own
- Modifications to the UI to allow all other CPUs

# Dependancies
- Docker

# Build DEB Packages
```bash
make
```

`DEB` fills will be stored in `bin/`

# Installation

There will be a debug as well as a regular build.

You will want to use `dpkg` to install the non-debug version on proxmox unless you are debugging or developing.
