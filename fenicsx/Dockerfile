# Copyright (C) 2022-2024 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

ARG ARGS
FROM numericalpdes/base_images:slepc4py-${ARGS} as slepc4py_args

FROM numericalpdes/base_images:base

ARG ARGS

COPY --from=numericalpdes/base_images:boost /usr /usr
COPY --from=numericalpdes/base_images:vtk /usr /usr
COPY --from=numericalpdes/base_images:pybind11 /usr /usr
COPY --from=slepc4py_args /usr /usr
COPY . ${DOCKER_SCRIPTS}

RUN cd ${DOCKER_SCRIPTS} && . scripts/docker_pre.sh && cd - && \
    cd ${INSTALL_SCRIPTS} && bash fenicsx/build.sh ${ARGS} && cd - && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -
