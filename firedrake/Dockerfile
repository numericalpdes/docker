# Copyright (C) 2022-2023 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

ARG ARGS
FROM numericalpdes/base_images:slepc4py-${ARGS} as slepc4py_args

FROM numericalpdes/base_images:base
MAINTAINER Francesco Ballarin <francesco.ballarin@unicatt.it>

ARG ARGS

COPY . ${DOCKER_SCRIPTS}
COPY --from=numericalpdes/base_images:boost /usr /usr
COPY --from=numericalpdes/base_images:pybind11 /usr /usr
COPY --from=slepc4py_args /usr /usr
COPY --from=numericalpdes/base_images:vtk /usr /usr

RUN cd ${DOCKER_SCRIPTS} && . scripts/docker_pre.sh && cd - && \
    cd ${INSTALL_SCRIPTS} && truncate -s 0 firedrake/patches/01-pyop2-static-libstdc++ && sed -i 's|https://github.com/firedrakeproject/ufl.git|https://github.com/FEniCS/ufl.git|g' firedrake/build.sh && bash firedrake/build.sh ${ARGS} && cd - && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -
