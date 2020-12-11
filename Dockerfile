#Download base image ubuntu  
FROM ubuntu 

#Label
LABEL maintainer="sajmoham@redhat.com"
LABEL version="0.1"
LABEL description = "Custom Docker Image For Glusterfs Image Building"

#Disable prompt During package INstallation
ARG DEBIAN_FRONTEND=noninteractive

#Update Ubuntu
RUN apt update -y

#Install Dependencies
RUN apt-get install -y make automake autoconf libtool flex bison  \
    pkg-config libssl-dev libxml2-dev python-dev libaio-dev       \
    libibverbs-dev librdmacm-dev libreadline-dev liblvm2-dev      \
    libglib2.0-dev liburcu-dev libcmocka-dev libsqlite3-dev       \
    libacl1-dev uuid-dev git



RUN echo "#!/bin/bash\n" > /startscript.sh
RUN echo "mkdir github\n" >> /startscript.sh
RUN echo "cd github\n" >> /startscript.sh
RUN echo "git clone https://github.com/msaju/TEST_G.git\n" >> /startscript.sh
RUN echo "cd TEST_G\n" >> /startscript.sh
RUN echo " ./autogen.sh\n" >> /startscript.sh
RUN echo " ./configure\n" >> /startscript.sh
RUN echo " make\n" >> /startscript.sh

RUN chmod +x /startscript.sh

CMD /startscript.sh
