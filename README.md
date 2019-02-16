Latex & Miniconda 3 docker container
=====

[![Docker Build Status](https://img.shields.io/docker/automated/jgoldfar/miniconda3-latex.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/jgoldfar/miniconda3-latex.svg)](https://hub.docker.com/r/jgoldfar/miniconda3-latex/)
[![Build Status](https://travis-ci.org/jgoldfar/miniconda3-latex-docker.svg?branch=master)](https://travis-ci.org/jgoldfar/miniconda3-latex-docker)

This container helps with compilation of latex sources without the need to maintain a LaTeX installation on your system.

This repository is forked from blang's repository in order to add other packages needed for a CI setup.

Setup
-----
First, add your local user to docker group:
```bash
sudo usermod -aG docker YOURUSERNAME
```

build:
```bash
docker build -t jgoldfar/miniconda3-latex .

```

Usage:
-----

```bash
docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$(pwd)":/data jgoldfar/miniconda3-latex

# Or better in one go (does not start container twice)
docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$(pwd)":/data jgoldfar/miniconda3-latex /bin/sh -c "pdflatex example.tex && pdflatex example.tex"

# View
./example.pdf
```
`WORKDIRs` match, mounted to `/data` inside container.

Why should I use this container?

-----

- Easy setup

## Container Descriptions

* `full` includes texlive-full

* `minimal` includes TeX + LaTeX, but you'll have to install any required packages.
