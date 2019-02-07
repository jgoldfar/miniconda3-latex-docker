FROM jgoldfar/latex-julia-docker:reqs-latest

# Make sure we don't get notifications we can't answer during building.
ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer "Jonathan Goldfarb <jgoldfar@my.fit.edu>"

RUN apt-get -q -y update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o DPkg::Options::="--force-confold" && \
    apt-get -q -y install \
      gfortran \
      m4 \
      cmake

ENV JuliaDevPath /opt/julia-dev

RUN mkdir -p ${JuliaDevPath} && \
    git clone https://github.com/JuliaLang/julia.git ${JuliaDevPath} && \
    cd ${JuliaDevPath} && \
    make USE_BINARYBUILDER_LLVM=1 && \
    make install
