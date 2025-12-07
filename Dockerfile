FROM postgres:17-trixie

# https://packages.debian.org/trixie/source/pgvector
# renovate: datasource=repology depName=debian_13/postgresql-17-pgvector versioning=loose
ENV PGVECTOR_VERSION="0.8.0-1"

# https://packages.debian.org/trixie/source/git
# renovate: datasource=repology depName=debian_13/git versioning=loose
ENV GIT_VERSION="2.45.0"

# Install pgvector extension using apt-get
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    && apt-get install -y postgresql-17-pgvector="${PGVECTOR_VERSION}" \
    && git="${GIT_VERSION}" \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
