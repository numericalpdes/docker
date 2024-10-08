# Copyright (C) 2022-2024 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

ARG ARGS
FROM numericalpdes/base_images:fenicsx-${ARGS} as fenicsx_args
FROM numericalpdes/base_images:firedrake-${ARGS} as firedrake_args
FROM numericalpdes/base_images:ngsolve-${ARGS} as ngsolve_args

FROM numericalpdes/base_images:base

ARG ARGS

COPY --from=fenicsx_args /usr /usr
COPY --from=firedrake_args /usr /usr
COPY --from=numericalpdes/base_images:gmsh /usr /usr
COPY --from=ngsolve_args /usr /usr
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
