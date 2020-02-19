FROM ubuntu:18.04
LABEL maintainer="Niklas Hauser <niklas.hauser@rwth-aachen.de>"
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
    wget -qO- https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2 | tar -xj

ENV PATH "/work/gcc-arm-none-eabi-9-2019-q4-major/bin:$PATH"
