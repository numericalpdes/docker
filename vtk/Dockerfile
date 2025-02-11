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
        sed -i "s|patch -p 1 < \$REPODIR/vtk/patches/01-start-xvfb|patch -p 1 < \$REPODIR/vtk/patches/01-start-xvfb\napt install -y -q python3-paraview\nsed -i \"s/'vtk<9.4.0',//\" pyproject.toml|" vtk/build.sh && \
        bash vtk/build.sh && \
        cd - && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -
