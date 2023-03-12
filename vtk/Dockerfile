# Copyright (C) 2022-2023 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

FROM numericalpdes/base_images:base
MAINTAINER Francesco Ballarin <francesco.ballarin@unicatt.it>

COPY . ${DOCKER_SCRIPTS}
COPY --from=numericalpdes/base_images:h5py /usr /usr

RUN cd ${DOCKER_SCRIPTS} && . scripts/docker_pre.sh && cd - && \
    cd ${INSTALL_SCRIPTS} && ln -s /usr/lib/x86_64-linux-gnu/libstdc++.so.6 $INSTALL_PREFIX/lib/libstdc++.so && bash vtk/build.sh && cd - && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -
