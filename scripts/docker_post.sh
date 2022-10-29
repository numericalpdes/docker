# Copyright (C) 2022-2023 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

# Clean up apt
apt -qq clean
rm -rf /var/lib/apt/lists/*

# Clean up caches and temporary folders
rm -rf /tmp/* /var/tmp/* /root/.cache

# Undo temporary changes in FEM on Colab repository
cd ${INSTALL_SCRIPTS}
git reset --hard
cd -
