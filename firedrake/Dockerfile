# Copyright (C) 2022-2025 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

ARG ARGS
FROM numericalpdes/base_images:slepc4py-${ARGS} as slepc4py_args

FROM numericalpdes/base_images:base

ARG ARGS

COPY --from=numericalpdes/base_images:boost /usr /usr
COPY --from=numericalpdes/base_images:pybind11 /usr /usr
COPY --from=slepc4py_args /usr /usr
COPY --from=numericalpdes/base_images:vtk /usr /usr
COPY . ${DOCKER_SCRIPTS}

# firedake's version of ufl is not necessarily in sync with upstream one. However, since
# the final numericalpdes image contains both FEniCSx and firedake, we need firedake's ufl
# with upstream ufl. For this reason, we rename to ufl_fork the ufl version required by firedrake
RUN cd ${DOCKER_SCRIPTS} && . scripts/docker_pre.sh && cd - && \
    cd ${INSTALL_SCRIPTS} && \
        sed -i "s|cd /tmp/ufl-src|${DOCKER_SCRIPTS}/scripts/replace_ufl.sh /tmp/ufl-src\ncd /tmp/ufl-src\nmv ufl ufl_fork|g" firedrake/build.sh && \
        sed -i "s|cd /tmp/finat-src|${DOCKER_SCRIPTS}/scripts/replace_ufl.sh /tmp/finat-src\ncd /tmp/finat-src|g" firedrake/build.sh && \
        sed -i "s|cd /tmp/tsfc-src|${DOCKER_SCRIPTS}/scripts/replace_ufl.sh /tmp/tsfc-src\ncd /tmp/tsfc-src|g" firedrake/build.sh && \
        sed -i "s|cd /tmp/pyadjoint-src|${DOCKER_SCRIPTS}/scripts/replace_ufl.sh /tmp/pyadjoint-src\ncd /tmp/pyadjoint-src|g" firedrake/build.sh && \
        sed -i "s|cd /tmp/firedrake-src|${DOCKER_SCRIPTS}/scripts/replace_ufl.sh /tmp/firedrake-src\ncd /tmp/firedrake-src|g" firedrake/build.sh && \
        echo "if [ ! python3 -m pip list | grep -w fenics-ufl ]; then echo 'Upstream ufl was installed' && false; fi" >> firedrake/build.sh && \
        bash firedrake/build.sh ${ARGS} && \
        cd - && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -
