FROM plexinc/pms-docker:plexpass

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y python3 git build-essential libargtable2-dev autoconf \
    libtool-bin ffmpeg libsdl1.2-dev libavutil-dev libavformat-dev libavcodec-dev && \

# Clone Comskip
    cd /opt && \
    git clone git://github.com/erikkaashoek/Comskip && \
    cd Comskip && \
    ./autogen.sh && \
    ./configure && \
    make && \
    chmod -R 777 /opt/Comskip /tmp/ && \

# Cleanup
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*

ADD ./comskip.ini /opt/Comskip/comskip.ini
