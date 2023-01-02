# Copyright (C) 2022-2023 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

# Prepare apt
export DEBIAN_FRONTEND="noninteractive"
apt -y -qq update

# Clone FEM on Colab repository
apt install -y -qq git
if [ ! -d $INSTALL_SCRIPTS ]; then
    git clone https://github.com/fem-on-colab/fem-on-colab.git $INSTALL_SCRIPTS
else
    cd $INSTALL_SCRIPTS
    git pull origin main
    cd -
fi

# Temporarily clear out install.sh from FEM on Colab repository
find ${INSTALL_SCRIPTS} -type f -name install.sh -exec truncate -s 0 {} \;

# Create symbolic link for python installation path, due to hardcoded version in FEM on Colab scripts
apt install -y -qq python3
ln -s ${INSTALL_PREFIX}/lib/${PYTHON_VERSION} ${INSTALL_PREFIX}/lib/python3.7

# Increase verbosity
export VERBOSE=1
export V=1
