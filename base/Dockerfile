# Copyright (C) 2022 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

FROM ubuntu:rolling AS base
MAINTAINER Francesco Ballarin <francesco.ballarin@unicatt.it>

ENV INSTALL_PREFIX=/usr/local \
    INSTALL_SCRIPTS=/usr/local/share/fem-on-colab \
    DOCKER_SCRIPTS=/usr/local/share/numerical-pdes-docker

COPY . ${DOCKER_SCRIPTS}

RUN cd ${DOCKER_SCRIPTS} && \
    . scripts/docker_pre.sh && \
    bash base/build.sh && cp base/bin/ldd ${INSTALL_PREFIX}/bin && \
    . scripts/docker_post.sh && \
    cd -

ENV PATH="${INSTALL_PREFIX}/bin:${PATH}" \
    LD_LIBRARY_PATH="${INSTALL_PREFIX}/lib:${LD_LIBRARY_PATH}" \
    PYTHONPATH="${INSTALL_PREFIX}/lib/python3/dist-packages:${INSTALL_PREFIX}/lib/python3/site-packages:${PYTHONPATH}"
