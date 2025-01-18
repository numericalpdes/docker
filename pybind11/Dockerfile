# Copyright (C) 2022-2025 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

ARG ARCH

FROM ghcr.io/numericalpdes/mpi4py:latest-${ARCH} AS mpi4py

FROM ghcr.io/numericalpdes/base:latest-${ARCH}

COPY --from=mpi4py /etc /etc
COPY --from=mpi4py /usr /usr
COPY . ${DOCKER_SCRIPTS}

RUN cd ${DOCKER_SCRIPTS} && . scripts/docker_pre.sh && cd - && \
    cd ${INSTALL_SCRIPTS} && bash pybind11/build.sh && cd - && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -
