# Copyright (C) 2022-2026 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

ARG ARCH

FROM ghcr.io/numericalpdes/base:latest-${ARCH}

COPY . ${DOCKER_SCRIPTS}

RUN cd ${DOCKER_SCRIPTS} && . scripts/docker_pre.sh && cd - && \
    apt install -y -qq zlib1g-dev && \
    cd ${INSTALL_SCRIPTS} && bash boost/build.sh && cd - && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -
