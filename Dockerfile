FROM svenv/base
MAINTAINER Sven van de Scheur <svenvandescheur@gmail.com>

# Compile tarsnap
RUN apt-get install -y gcc libc6-dev make libssl-dev zlib1g-dev e2fslibs-dev && \
    wget https://www.tarsnap.com/download/tarsnap-autoconf-1.0.37.tgz && \
    tar -xzf tarsnap-autoconf-1.0.37.tgz && \
    cd tarsnap-autoconf-1.0.37/ && \
    ./configure && \
    make && \
    make install

# Add file tree
ADD files /