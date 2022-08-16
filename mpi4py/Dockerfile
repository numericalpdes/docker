# Copyright (C) 2022 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

FROM numericalpdes/base_images:base
MAINTAINER Francesco Ballarin <francesco.ballarin@unicatt.it>

COPY . /usr/local/share/numerical-pdes-docker
WORKDIR /usr/local/share/numerical-pdes-docker

RUN . scripts/docker_pre.sh && \
    cd ${INSTALL_SCRIPTS} && \
    bash mpi4py/build.sh && \
    cd - && \
    . scripts/docker_post.sh
