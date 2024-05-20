# Copyright (C) 2022-2024 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

set -e
set -x

# Expect the source path as the first argument
: ${1?"Usage: $0 source_path"}
SOURCE_PATH="$1"

cd ${SOURCE_PATH}

# Replace ufl with ufl_fork in python files
find . -type f -not -path "./.git/*" -exec sed -i -e 's|import ufl$|import ufl_fork|g' {} \;
find . -type f -not -path "./.git/*" -exec sed -i -e 's|import ufl"|import ufl_fork"|g' {} \;
find . -type f -not -path "./.git/*" -exec sed -i 's|import ufl\.|import ufl_fork\.|g' {} \;
find . -type f -not -path "./.git/*" -exec sed -i 's|from ufl |from ufl_fork |g' {} \;
find . -type f -not -path "./.git/*" -exec sed -i 's|from ufl\.|from ufl_fork\.|g' {} \;
find . -type f -not -path "./.git/*" -exec sed -i -e 's|del ufl$|del ufl_fork|g' {} \;
find . -type f -not -path "./.git/*" -exec sed -i 's|ufl\.|ufl_fork\.|g' {} \;

# Replace ufl with ufl_fork in pyproject
find . -type f -not -path "./.git/*" -exec sed -i 's|"ufl"|"ufl_fork"|g' {} \;
find . -type f -not -path "./.git/*" -exec sed -i 's|fenics-ufl|fenics-ufl-fork|g' {} \;

# finat.ufl must be left unchanged
find . -type f -not -path "./.git/*" -exec sed -i 's|finat\.ufl_fork\.|finat\.ufl\.|g' {} \;

# tsfc.ufl2gem must be left unchanged
find . -type f -not -path "./.git/*" -exec sed -i 's|ufl_fork2gem|ufl2gem|g' {} \;
