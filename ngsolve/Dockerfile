# Copyright (C) 2022 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

FROM numericalpdes/base_images:base
MAINTAINER Francesco Ballarin <francesco.ballarin@unicatt.it>

COPY . ${DOCKER_SCRIPTS}
COPY --from=numericalpdes/base_images:occ /usr /usr
COPY --from=numericalpdes/base_images:petsc4py-real /usr /usr
COPY --from=numericalpdes/base_images:pybind11 /usr /usr

RUN cd ${DOCKER_SCRIPTS} && . scripts/docker_pre.sh && cd - && \
    apt install -y -qq libfontconfig1 libgl1 && \
    cd ${INSTALL_SCRIPTS} && truncate -s 0 ngsolve/patches/03-ngscxx-ngsld-static-libstdc++ && bash ngsolve/build.sh && cd - && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -
