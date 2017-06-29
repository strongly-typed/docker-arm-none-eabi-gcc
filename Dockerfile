FROM ubuntu:16.04
MAINTAINER Sascha Schade (strongly-typed) <stronglytyp3d@gmail.com>
LABEL Description="Image for building and debugging arm-embedded projects from git"
WORKDIR /work

ADD . /work

# Install any needed packages specified in requirements.txt
RUN apt update && \
    apt upgrade -y && \
    apt install -y \
# Development files
      build-essential \
      git \
      bzip2 \
      wget && \
    apt clean && \
    wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/6-2017q2/gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2 -O cortex_m.tar.bz2 && \
    tar -xjf cortex_m.tar.bz2 && \
    rm cortex_m.tar.bz2

ENV PATH "/work/gcc-arm-none-eabi-6-2017-q2-update/bin:$PATH"
