# Copyright (C) 2022-2026 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

ARG ARCH

FROM ghcr.io/numericalpdes/h5py:latest-${ARCH} AS h5py

FROM ghcr.io/numericalpdes/base:latest-${ARCH}

ARG ARGS

COPY --from=h5py /etc /etc
COPY --from=h5py /usr /usr
COPY . ${DOCKER_SCRIPTS}

RUN cd ${DOCKER_SCRIPTS} && . scripts/docker_pre.sh && cd - && \
    apt install -y -qq libblas-dev libcurl4-openssl-dev liblapack-dev libxml2-dev && \
    cd ${INSTALL_SCRIPTS} && bash petsc4py/build.sh development ${ARGS} && cd - && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -
