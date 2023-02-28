# Copyright (C) 2022-2023 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

set -e
set -x

# Common
apt install -y -qq autoconf bison build-essential cmake curl flex git jq libtool libtool-bin pkg-config rsync software-properties-common unzip wget

# gcc
apt install -y gcc g++ gfortran

# pip
apt install -y -qq python3-pip

# Numpy
pip3 install numpy

# matplotlib
pip3 install matplotlib

# scipy
pip3 install scipy

# Cython
pip3 install Cython

# sympy
pip3 install sympy

# jupyter (for testing)
pip3 install jupyter

# pytest, nbval and nbvalx (for testing)
pip3 install nbval pytest
pip3 install --no-dependencies git+https://github.com/multiphenics/nbvalx.git

# X11 related packages
apt install -y -qq libfontconfig1 libgl1 libgl1-mesa-dev libglu1-mesa libxrender1 libxcursor1  libxft2 libxinerama1 xvfb
