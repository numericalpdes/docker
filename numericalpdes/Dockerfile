# Copyright (C) 2022-2026 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

ARG ARCH
ARG ARGS

FROM ghcr.io/numericalpdes/fenicsx-${ARGS}:latest-${ARCH} AS fenicsx
FROM ghcr.io/numericalpdes/firedrake-${ARGS}:latest-${ARCH} AS firedrake
FROM ghcr.io/numericalpdes/gmsh:latest-${ARCH} AS gmsh
FROM ghcr.io/numericalpdes/ngsolve-${ARGS}:latest-${ARCH} AS ngsolve

FROM ghcr.io/numericalpdes/base:latest-${ARCH}

COPY --from=fenicsx /etc /etc
COPY --from=fenicsx /usr /usr
COPY --from=firedrake /etc /etc
COPY --from=firedrake /usr /usr
COPY --from=gmsh /etc /etc
COPY --from=gmsh /usr /usr
COPY --from=ngsolve /etc /etc
COPY --from=ngsolve /usr /usr
COPY . ${DOCKER_SCRIPTS}

RUN cd ${DOCKER_SCRIPTS} && . scripts/docker_pre.sh && cd - && \
    python3 -m pip install jupyterlab && \
    cd ${DOCKER_SCRIPTS} && . scripts/docker_post.sh && cd -

WORKDIR /root

ENV SHELL /bin/bash
RUN echo "export PATH=${PATH}" >> .bashrc && \
    echo "export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}" >> .bashrc && \
    echo "export PYTHONPATH=${PYTHONPATH}" >> .bashrc && \
    echo "#!/bin/bash" > run_jupyter && echo "jupyter lab --ip 0.0.0.0 --port 8888 --no-browser --allow-root" > run_jupyter && chmod ugo+x run_jupyter

EXPOSE 8888/tcp
ENTRYPOINT ["jupyter", "lab", "--ip", "0.0.0.0", "--port", "8888", "--no-browser", "--allow-root"]
