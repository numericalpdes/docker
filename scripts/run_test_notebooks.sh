# Copyright (C) 2022-2025 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

set -e
set -x

# Expect the scalar type arg as the first argument and the directories to be tested as the remaining args
: ${3?"Usage: $0 arch scalar_type directory1 [directory2 [...]]"}
ARCH="$1"
shift
SCALAR_TYPE="$1"
shift

python3 -m pip install --no-dependencies nbvalx simpleeval
NBVALX_VERSION=$(python3 -c 'import importlib.metadata; print(importlib.metadata.version("nbvalx"))')

cd ${INSTALL_SCRIPTS}
git reset --hard
for LIBRARY in "$@"; do
    if [[ "${LIBRARY}" == "firedrake" ]]; then
        ${DOCKER_SCRIPTS}/scripts/replace_ufl.sh ${LIBRARY}
        for TEST in test-fireshape.ipynb test-irksome.ipynb; do
            sed -i -e "s|python3 -m pip install --no-dependencies git+\(.*\).git|CLONE_DIR=\$(mktemp -d) \&\& git clone \1.git \${CLONE_DIR} \&\& \${DOCKER_SCRIPTS}/scripts/replace_ufl.sh \${CLONE_DIR} \&\& cd \${CLONE_DIR} \&\& python3 -m pip install --no-dependencies \.|g" ${LIBRARY}/${TEST}
        done
    elif [[ "${LIBRARY}" == "vtk" && "${ARCH}" == "arm64" ]]; then
        rm vtk/test-pyvista.ipynb vtk/test-vtk.ipynb
    fi
    wget https://github.com/nbvalx/nbvalx/raw/v${NBVALX_VERSION}/tests/notebooks/conftest.py -O ${LIBRARY}/conftest.py
    ARGS="${SCALAR_TYPE}" pytest --nbval-cell-timeout=300 ${LIBRARY}/
done
git reset --hard
