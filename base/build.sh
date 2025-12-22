# Copyright (C) 2022-2025 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

set -e
set -x

# Common
apt install -y -qq autoconf bison build-essential curl flex git jq libtool libtool-bin ninja-build patchelf pkg-config rsync unzip wget

# gcc
apt install -y gcc g++ gfortran

# python
apt install -y -qq python3-dev

# pip
apt install -y -qq python3-pip
rm /usr/lib/python3.*/EXTERNALLY-MANAGED

# setuptools
apt install -y -qq python3-setuptools

# cmake
apt install -y -qq cmake
python3 -m pip install cmake

# Numpy
python3 -m pip install numpy

# matplotlib
python3 -m pip install matplotlib

# scipy
python3 -m pip install scipy

# Cython
python3 -m pip install Cython

# sympy
python3 -m pip install sympy

# jupyter (for testing)
python3 -m pip install jupyter

# pytest and nbval (for testing)
python3 -m pip install nbval pytest

# X11 related packages
apt install -y -qq libfontconfig1 libgl1 libgl1-mesa-dev libglu1-mesa libxrender1 libxcursor1  libxft2 libxinerama1 xvfb
