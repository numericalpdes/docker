# Copyright (C) 2022 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

set -e
set -x

# Common
apt install -y -qq autoconf bison build-essential cmake curl flex git jq libtool pkg-config rsync software-properties-common unzip wget

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

# pytest and nbval (for testing)
pip3 install nbval pytest
