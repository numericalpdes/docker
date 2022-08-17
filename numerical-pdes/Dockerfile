# Copyright (C) 2022 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

FROM numericalpdes/base_images:base
MAINTAINER Francesco Ballarin <francesco.ballarin@unicatt.it>

COPY . ${DOCKER_SCRIPTS}
COPY --from=numericalpdes/base_images:fenicsx-real /usr /usr
COPY --from=numericalpdes/base_images:firedrake-real /usr /usr
COPY --from=numericalpdes/base_images:gmsh /usr /usr
COPY --from=numericalpdes/base_images:ngsolve /usr /usr
