# Copyright (C) 2022 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

FROM numericalpdes/base_images:base
MAINTAINER Francesco Ballarin <francesco.ballarin@unicatt.it>

COPY . ${DOCKER_SCRIPTS}
COPY --from=numericalpdes/base_images:mpi4py /usr /usr

RUN cd ${DOCKER_SCRIPTS} && . scripts/docker_pre.sh && cd - && \
    apt install -y -qq zlib1g-dev && \
    cd ${INSTALL_SCRIPTS} && bash h5py/build.sh && cd - && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -
