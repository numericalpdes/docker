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
    wget https://github.com/nbvalx/nbvalx/raw/v${NBVALX_VERSION}/tests/notebooks/conftest.py -O ${LIBRARY}/conftest.py
    ARGS="development ${SCALAR_TYPE}" pytest --nbval-cell-timeout=300 ${LIBRARY}/
done
git reset --hard
