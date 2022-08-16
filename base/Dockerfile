# Copyright (C) 2022 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

FROM ubuntu:rolling AS base
MAINTAINER Francesco Ballarin <francesco.ballarin@unicatt.it>

COPY . /tmp/docker_repo
WORKDIR /tmp/docker_repo

RUN . scripts/docker_pre.sh && \
    bash base/build.sh && \
    . scripts/docker_post.sh

RUN echo "export OMPI_ALLOW_RUN_AS_ROOT=1" >> ~/.bashrc && \
    echo "export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1" >> ~/.bashrc
