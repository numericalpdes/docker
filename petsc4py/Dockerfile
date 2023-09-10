# Copyright (C) 2022-2023 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

FROM numericalpdes/base_images:base
MAINTAINER Francesco Ballarin <francesco.ballarin@unicatt.it>

ARG ARGS

COPY --from=numericalpdes/base_images:h5py /usr /usr
COPY . ${DOCKER_SCRIPTS}

RUN cd ${DOCKER_SCRIPTS} && . scripts/docker_pre.sh && cd - && \
    apt install -y -qq libblas-dev libcurl4-openssl-dev liblapack-dev libxml2-dev && \
    ln -fs /usr/lib/x86_64-linux-gnu/blas/* /usr/lib/x86_64-linux-gnu/ && ln -fs /usr/lib/x86_64-linux-gnu/lapack/* /usr/lib/x86_64-linux-gnu/ && \
    cd ${INSTALL_SCRIPTS} && bash petsc4py/build.sh ${ARGS} && cd - && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -
