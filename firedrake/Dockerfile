# Copyright (C) 2022-2025 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

ARG ARGS
FROM numericalpdes/base_images:slepc4py-${ARGS} AS slepc4py_args

FROM numericalpdes/base_images:base

ARG ARGS

COPY --from=numericalpdes/base_images:boost /usr /usr
COPY --from=numericalpdes/base_images:pybind11 /usr /usr
COPY --from=slepc4py_args /usr /usr
COPY --from=numericalpdes/base_images:vtk /usr /usr
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
        bash firedrake/build.sh ${ARGS} && \
        cd - && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -
