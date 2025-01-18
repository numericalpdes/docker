# Copyright (C) 2022-2025 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

ARG ARCH
ARG ARGS

FROM ghcr.io/numericalpdes/boost:latest-${ARCH} AS boost
FROM ghcr.io/numericalpdes/pybind11:latest-${ARCH} AS pybind11
FROM ghcr.io/numericalpdes/slepc4py-${ARGS}:latest-${ARCH} AS slepc4py

FROM ghcr.io/numericalpdes/base:latest-${ARCH}

ARG ARGS

COPY --from=boost /etc /etc
COPY --from=boost /usr /usr
COPY --from=pybind11 /etc /etc
COPY --from=pybind11 /usr /usr
COPY --from=slepc4py /etc /etc
COPY --from=slepc4py /usr /usr
COPY . ${DOCKER_SCRIPTS}

RUN cd ${DOCKER_SCRIPTS} && . scripts/docker_pre.sh && cd - && \
    cd ${INSTALL_SCRIPTS} && bash fenics/build.sh ${ARGS} && cd - && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -
