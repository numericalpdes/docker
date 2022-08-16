# Copyright (C) 2022 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

FROM ubuntu:rolling AS base
MAINTAINER Francesco Ballarin <francesco.ballarin@unicatt.it>

COPY . /usr/local/share/numerical-pdes-docker
WORKDIR /usr/local/share/numerical-pdes-docker

RUN . scripts/docker_pre.sh && \
    bash base/build.sh && \
    echo "export PATH=\"${INSTALL_PREFIX}/bin:${PATH}\"" >> /etc/profile && \
    echo "export LD_LIBRARY_PATH=\"${INSTALL_PREFIX}/lib:${LD_LIBRARY_PATH}\"" >> /etc/profile && \
    echo "export PYTHONPATH=\"${INSTALL_PREFIX}/lib/${PYTHON_VERSION}/dist-packages:${INSTALL_PREFIX}/lib/${PYTHON_VERSION}/site-packages:${PYTHONPATH}\"" >> /etc/profile && \
    . scripts/docker_post.sh
