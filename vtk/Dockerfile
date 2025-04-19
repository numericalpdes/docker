# Copyright (C) 2022-2025 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

ARG ARCH

FROM ghcr.io/numericalpdes/h5py:latest-${ARCH} AS h5py

FROM ghcr.io/numericalpdes/base:latest-${ARCH}

ARG ARCH

COPY --from=h5py /etc /etc
COPY --from=h5py /usr /usr
COPY . ${DOCKER_SCRIPTS}

RUN cd ${DOCKER_SCRIPTS} && . scripts/docker_pre.sh && cd - && \
    cd ${INSTALL_SCRIPTS} && \
        sed -i "s|patch -p 1 < \$REPODIR/vtk/patches/01-start-xvfb|git checkout v0.44.2\nwget https://github.com/fem-on-colab/fem-on-colab/raw/91f3a6d8d55622e8ec9a1dd66bbf5c9dadc6796b/vtk/patches/01-start-xvfb\npatch -p 1 < 01-start-xvfb\napt install -y -q python3-paraview\nsed -i \"s/'vtk<9.4.0',//\" pyproject.toml|" vtk/build.sh && \
        bash vtk/build.sh && \
        cd - && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -
