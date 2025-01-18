# Copyright (C) 2022-2025 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

ARG ARCH
ARG ARGS

FROM ghcr.io/numericalpdes/occ:latest-${ARCH} AS occ
FROM ghcr.io/numericalpdes/pybind11:latest-${ARCH} AS pybind11
FROM ghcr.io/numericalpdes/slepc4py-${ARGS}:latest-${ARCH} AS slepc4py

FROM ghcr.io/numericalpdes/base:latest-${ARCH}

ARG ARCH
ARG ARGS

COPY --from=occ /etc /etc
COPY --from=occ /usr /usr
COPY --from=pybind11 /etc /etc
COPY --from=pybind11 /usr /usr
COPY --from=slepc4py /etc /etc
COPY --from=slepc4py /usr /usr
COPY . ${DOCKER_SCRIPTS}

RUN cd ${DOCKER_SCRIPTS} && . scripts/docker_pre.sh && cd - && \
    cd ${INSTALL_SCRIPTS} && \
        if [ "${ARCH}" = "arm64" ]; then sed -i 's|cd /tmp/netgen-src/build|awk '\''/void FMAComplex/ {in_func=1} in_func {print "//" $0} !in_func {print} /}/ \&\& in_func {in_func=0}'\'' libsrc/core/simd_arm64.hpp > libsrc/core/simd_arm64.hpp.tmp \&\& mv libsrc/core/simd_arm64.hpp.tmp libsrc/core/simd_arm64.hpp \&\& cd /tmp/netgen-src/build|' ngsolve/build.sh; fi && \
        bash ngsolve/build.sh ${ARGS} && \
        cd - && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -
