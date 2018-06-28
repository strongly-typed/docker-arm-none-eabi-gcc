FROM ubuntu:18.04
MAINTAINER Niklas Hauser <niklas.hauser@rwth-aachen.de>
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
    wget -qO- https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2 | tar -xj

ENV PATH "/work/gcc-arm-none-eabi-7-2018-q2-update/bin:$PATH"
