FROM jgoldfar/latex-julia-docker:reqs-latest

# Make sure we don't get notifications we can't answer during building.
ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer "Jonathan Goldfarb <jgoldfar@my.fit.edu>"

# TODO: Add source build of Julia
ENV JuliaDevPath /opt/julia-dev

RUN mkdir -p ${JuliaDevPath} && \
    git clone https://github.com/JuliaLang/julia.git ${JuliaDevPath} && \
    cd ${JuliaDevPath} && \
    make install
