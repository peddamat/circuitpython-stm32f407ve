# References:
# - https://docs.micropython.org/en/latest/develop/gettingstarted.html
# - https://github.com/mcauser/BLACK_F407VE

FROM ubuntu:22.04

# Install dependencies
RUN apt update &&  apt install -y \
    vim \
    build-essential libffi-dev git pkg-config \
    gcc-arm-none-eabi binutils-arm-none-eabi libnewlib-arm-none-eabi \
    python3 python3-pip \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /root

RUN git clone https://github.com/adafruit/circuitpython.git

WORKDIR /root/circuitpython

RUN pip3 install --upgrade -r requirements-dev.txt

RUN make fetch-submodules

RUN cd ports/stm/boards && git clone https://github.com/mcauser/BLACK_F407VE.git

RUN apt update &&  apt install -y gettext

#RUN cd /root/circuitpython/ports/atmel-samd && make BOARD=circuitplayground_express

RUN cd /root/circuitpython/ports/stm && make BOARD=stm32f411ce_blackpill
