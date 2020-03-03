# pve-qemu-unlocked

Proxmox does not support anything other than `x86` or `x64` even though `qemu` which is in it's backend supports to emulate MANY other CPU architectures.

This `Dockerfile` and `make` script will build your own version of `pve-qemu` and remove the `--target-list` configure options enabling all supported CPUs and emulations for the proxmox `pve-qemu` DEB package.

Since this is done with docker you need not worry about any other dependancies other than docker to build the DEB packages you need.

# Dependancies
- Docker

# Build DEB Packages
```bash
make
```

`DEB` fills will be stored in `bin/`

# Installation

There will be a debug as well as a regular build for most purposes you will want to use `dpkg` to install the non-debug version on proxmox.
