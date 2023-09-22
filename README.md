Latex & Miniconda 3 docker container
=====

[![Docker Build Status](https://img.shields.io/docker/automated/jgoldfar/miniconda3-latex.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/jgoldfar/miniconda3-latex.svg)](https://hub.docker.com/r/jgoldfar/miniconda3-latex/)

This container helps with compilation of latex sources without the need to maintain a LaTeX installation on your system.

Forked from blang's repository in order to add other packages needed for a CI setup, this repository is minimally maintained and accepts PRs. Thank you!

> This program is distributed in the hope that it will be useful,
> but WITHOUT ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

For more information, reach out to the team at [desert.frog.solutions@gmail.com](mailto:desert.frog.solutions@gmail.com) or [desertfrogsolutions.com](https://desertfrogsolutions.com)


Setup
-----
First, add your local user to docker group:
```bash
sudo usermod -aG docker YOURUSERNAME
```

Build the image you need. For the minimal image, run:
```bash
DOCKER_REPO_BASE="miniconda3-latex" docker build -f Dockerfile.minimal -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:minimal
```

For the full image, run:
```bash
DOCKER_REPO_BASE="miniconda3-latex" docker build -f Dockerfile.full -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:full
```

Push the image `${IMG_TAG}` with
```bash
docker push ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}/${IMG_TAG}
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
