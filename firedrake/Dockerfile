# Copyright (C) 2022-2025 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

ARG ARCH
ARG ARGS

FROM ghcr.io/numericalpdes/boost:latest-${ARCH} AS boost
FROM ghcr.io/numericalpdes/pybind11:latest-${ARCH} AS pybind11
FROM ghcr.io/numericalpdes/slepc4py-${ARGS}:latest-${ARCH} AS slepc4py
FROM ghcr.io/numericalpdes/vtk:latest-${ARCH} AS vtk

FROM ghcr.io/numericalpdes/base:latest-${ARCH}

ARG ARGS

COPY --from=boost /etc /etc
COPY --from=boost /usr /usr
COPY --from=pybind11 /etc /etc
COPY --from=pybind11 /usr /usr
COPY --from=slepc4py /etc /etc
COPY --from=slepc4py /usr /usr
COPY --from=vtk /etc /etc
COPY --from=vtk /usr /usr
COPY . ${DOCKER_SCRIPTS}

# firedake's version of ufl is not necessarily in sync with upstream one. However, since
# the final numericalpdes image contains both FEniCSx and firedake, we need firedake's ufl
# alongside upstream ufl. For this reason, we rename to ufl_fork the ufl version required by firedrake
RUN cd ${DOCKER_SCRIPTS} && . scripts/docker_pre.sh && cd - && \
    cd ${INSTALL_SCRIPTS} && \
        echo "git clone https://github.com/firedrakeproject/ufl.git /tmp/ufl-src" >> firedrake/build.sh && \
        echo "${DOCKER_SCRIPTS}/scripts/replace_ufl.sh /tmp/ufl-src" >> firedrake/build.sh && \
        echo "cd /tmp/ufl-src" >> firedrake/build.sh && \
        echo "mv ufl ufl_fork" >> firedrake/build.sh && \
        echo "PYTHONUSERBASE=${INSTALL_PREFIX} python3 -m pip install --user ." >> firedrake/build.sh && \
        echo "python3 -m pip uninstall -y fenics-ufl" >> firedrake/build.sh && \
        echo "${DOCKER_SCRIPTS}/scripts/replace_ufl.sh ${INSTALL_PREFIX}" >> firedrake/build.sh && \
        bash firedrake/build.sh development ${ARGS} && \
        cd - && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -
