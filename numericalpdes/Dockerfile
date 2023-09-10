# Copyright (C) 2022-2023 by the Hands On Numerical PDEs authors
#
# This file is part of Hands On Numerical PDEs.
#
# SPDX-License-Identifier: MIT

FROM numericalpdes/base_images:base
MAINTAINER Francesco Ballarin <francesco.ballarin@unicatt.it>

COPY --from=numericalpdes/base_images:fenicsx-real /usr /usr
COPY --from=numericalpdes/base_images:firedrake-real /usr /usr
COPY --from=numericalpdes/base_images:gmsh /usr /usr
COPY --from=numericalpdes/base_images:ngsolve /usr /usr
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
