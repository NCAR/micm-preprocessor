FROM fedora:33

RUN dnf -y update \
    && dnf -y install \
        nodejs \
        python3 \
        python3-pip \
    && dnf clean all

COPY . /micm-preprocessor

# install needed python packages
RUN pip3 install requests

# install needed nodejs modules
RUN cd /micm-preprocessor \
    && npm install

# create a folder to hold the preprocessor output if it
# hasn't been mounted from the host
RUN mkdir -p /mechanisms

# get command line argument to set location of mechanism
# configuration files
ENV MECHANISM_FOLDER=none-specified

# generate code for configuation in mechanism folder
CMD . /micm-preprocessor/etc/run_preprocessor.sh

