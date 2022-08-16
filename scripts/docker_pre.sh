# Copyright (C) 2022 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

# Export install prefix
export INSTALL_PREFIX=/usr/local

# Prepare apt
export DEBIAN_FRONTEND="noninteractive"
apt -y -qq update

# Clone FEM on Colab repository
apt install -y -qq git
export INSTALL_SCRIPTS="/usr/local/share/fem-on-colab"
if [ ! -d $INSTALL_SCRIPTS ]; then
    git clone https://github.com/fem-on-colab/fem-on-colab.git $INSTALL_SCRIPTS
else
    cd $INSTALL_SCRIPTS
    git pull origin main
    cd -
fi

# Create symbolic link for python installation path, due to hardcoded version in FEM on Colab scripts
PYTHON_VERSION=$(python3 -c "import sys; print('python{}.{}'.format(sys.version_info.major, sys.version_info.minor))")
ln -s ${INSTALL_PREFIX}/lib/${PYTHON_VERSION} ${INSTALL_PREFIX}/lib/python3.7

# Increase verbosity
export VERBOSE=1
export V=1
