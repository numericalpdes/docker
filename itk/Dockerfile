# Copyright (C) 2022-2023 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

FROM numericalpdes/base_images:base
MAINTAINER Francesco Ballarin <francesco.ballarin@unicatt.it>

COPY . ${DOCKER_SCRIPTS}
COPY --from=numericalpdes/base_images:vtk /usr /usr

RUN cd ${DOCKER_SCRIPTS} && . scripts/docker_pre.sh && cd - && \
    cd ${INSTALL_SCRIPTS} && sed -i 's|wget https://deb.nodesource.com/setup_14.x -O /tmp/npm-repos|wget https://deb.nodesource.com/setup_18.x -O /tmp/npm-repos; export NODE_OPTIONS=--openssl-legacy-provider|g' itk/build.sh && bash itk/build.sh && cd - && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -
