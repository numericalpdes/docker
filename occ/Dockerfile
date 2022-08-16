# Copyright (C) 2022 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

FROM numericalpdes/base_images:base
MAINTAINER Francesco Ballarin <francesco.ballarin@unicatt.it>

COPY . /tmp/docker_repo
WORKDIR /tmp/docker_repo

RUN . scripts/docker_pre.sh && \
    cd ${INSTALL_SCRIPTS} && \
    bash occ/build.sh && \
    cd - && \
    . scripts/docker_post.sh
