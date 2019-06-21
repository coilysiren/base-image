FROM ubuntu

RUN mkdir -p /projects
WORKDIR /projects

# "what is `set -euxo pipefile` for?"
#   docs: https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
#   blog post: https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/

# APT
RUN set -euxo pipefail \
  && apt-get update \
  && apt-get install -y \
    curl \
    git \
    shellcheck \
    build-essential \
    lsb-core

# PYTHON
#   website: https://www.python.org/
#   source: https://github.com/python/cpython
ENV PYTHON_VERSION 3.7.3
# control test: check that python doesn't already exist
RUN if command -v python 2>/dev/null; then exit 1; fi
RUN git clone \
  --depth "1" \
  --branch "$PYTHON_VERSION" \
  --config "advice.detachedHead=false" \
  "https://github.com/python/cpython.git"
WORKDIR /projects/cpython
RUN git checkout "$PYTHON_VERSION"
RUN ./configure
RUN make
RUN make test
# RUN python --version

WORKDIR /projects
