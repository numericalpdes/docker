# Copyright (C) 2022-2025 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

ARG ARCH
ARG ARGS

FROM ghcr.io/numericalpdes/petsc4py-${ARGS}:latest-${ARCH} AS petsc4py

FROM ghcr.io/numericalpdes/base:latest-${ARCH}

ARG ARGS

COPY --from=petsc4py /etc /etc
COPY --from=petsc4py /usr /usr
COPY . ${DOCKER_SCRIPTS}

RUN cd ${DOCKER_SCRIPTS} && . scripts/docker_pre.sh && cd - && \
    cd ${INSTALL_SCRIPTS} && bash slepc4py/build.sh ${ARGS} && cd - && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -
