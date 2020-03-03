FROM debian:stable
RUN apt-get update
RUN apt-get install -y git
RUN mkdir -p /opt/
WORKDIR /opt/
RUN git clone git://git.proxmox.com/git/pve-qemu
WORKDIR /opt/pve-qemu/
RUN apt-get install -y make \
    wget \
    curl \
    sed \
    nano \
    build-essential \
    autotools-dev \
    check \
    debhelper \
    libacl1-dev \
    libaio-dev \
    libcap-dev \
    libcurl4-gnutls-dev \
    libfdt-dev \
    libglusterfs-dev \
    libgnutls28-dev \
    libiscsi-dev \
    libjemalloc-dev \
    libjpeg-dev \
    libnuma-dev \
    libpci-dev \
    libpixman-1-dev \
    librbd-dev \
    libsdl1.2-dev \
    libseccomp-dev \
    libspice-protocol-dev \
    libspice-server-dev \
    libusb-1.0-0-dev \
    libusbredirparser-dev \
    python3-minimal \
    python3-sphinx \
    quilt texi2html \
    texinfo \
    uuid-dev \
    xfslibs-dev \
    lintian
RUN sed -i '/.*--target-list=.*/d' debian/rules
RUN make -j8
