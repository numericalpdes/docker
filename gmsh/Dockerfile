# Copyright (C) 2022-2025 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

ARG ARCH

FROM ghcr.io/numericalpdes/h5py:latest-${ARCH} AS h5py
FROM ghcr.io/numericalpdes/occ:latest-${ARCH} AS occ

FROM ghcr.io/numericalpdes/base:latest-${ARCH}

COPY --from=h5py /etc /etc
COPY --from=h5py /usr /usr
COPY --from=occ /etc /etc
COPY --from=occ /usr /usr
COPY . ${DOCKER_SCRIPTS}

RUN cd ${DOCKER_SCRIPTS} && . scripts/docker_pre.sh && cd - && \
    cd ${INSTALL_SCRIPTS} && bash gmsh/build.sh && cd - && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -
