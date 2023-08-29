# Copyright (C) 2022-2023 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

set -e
set -x

# Common
apt install -y -qq autoconf bison build-essential cmake curl flex git jq libtool libtool-bin ninja-build patchelf pkg-config rsync software-properties-common unzip wget

# gcc
apt install -y gcc g++ gfortran

# pip
apt install -y -qq python3-pip
rm /usr/lib/python3.*/EXTERNALLY-MANAGED

# Numpy
python3 -m pip install numpy

# matplotlib
python3 -m pip install matplotlib

# scipy
python3 -m pip install scipy

# Cython
python3 -m pip install "Cython<3.0"

# sympy
python3 -m pip install sympy

# jupyter (for testing)
python3 -m pip install jupyter

# pytest, nbval and nbvalx (for testing)
python3 -m pip install nbval pytest
python3 -m pip install --no-dependencies git+https://github.com/multiphenics/nbvalx.git

# X11 related packages
apt install -y -qq libfontconfig1 libgl1 libgl1-mesa-dev libglu1-mesa libxrender1 libxcursor1  libxft2 libxinerama1 xvfb
