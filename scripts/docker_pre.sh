# Copyright (C) 2022-2026 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

# Prepare apt
export DEBIAN_FRONTEND="noninteractive"
apt update -y -q

# Clone FEM on Colab repository
apt install -y -qq git
if [ ! -d $INSTALL_SCRIPTS ]; then
    git clone https://github.com/fem-on-colab/fem-on-colab.git $INSTALL_SCRIPTS
else
    cd $INSTALL_SCRIPTS
    git pull origin main || { echo "Failed to update FEM on Colab repository"; exit 1; }
    cd -
fi

# Temporarily clear out install.sh from FEM on Colab repository
find ${INSTALL_SCRIPTS} -type f -name install.sh -exec truncate -s 0 {} \;

# Increase verbosity
export VERBOSE=1
export V=1
