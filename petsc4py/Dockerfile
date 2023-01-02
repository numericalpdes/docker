# Copyright (C) 2022-2023 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

FROM numericalpdes/base_images:base
MAINTAINER Francesco Ballarin <francesco.ballarin@unicatt.it>

ARG ARGS

COPY . ${DOCKER_SCRIPTS}
COPY --from=numericalpdes/base_images:h5py /usr /usr

RUN cd ${DOCKER_SCRIPTS} && . scripts/docker_pre.sh && cd - && \
    apt install -y -qq libblas-dev liblapack-dev && \
    ln -fs /usr/lib/x86_64-linux-gnu/blas/* /usr/lib/x86_64-linux-gnu/ && ln -fs /usr/lib/x86_64-linux-gnu/lapack/* /usr/lib/x86_64-linux-gnu/ && \
    cd ${INSTALL_SCRIPTS} && truncate -s 0 petsc4py/patches/01-force-static-libstdc++ && bash petsc4py/build.sh ${ARGS} && cd - && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -
