# https://github.com/nodejs/docker-node/blob/056ab875500526e5088b49131c258575bf7c35c0/23/alpine3.21/Dockerfile
FROM node:23-alpine3.21

ARG IMAGE_CREATED="No image creation date set"
ARG IMAGE_SOURCE="No image source set"
ARG IMAGE_REVISION="No image revision set"
ARG IMAGE_URL="No image url set"
ARG IMAGE_VERSION="No image version set"
ARG IMAGE_DOCUMENTATION="No image documentation set"

# https://pkgs.alpinelinux.org/package/edge/main/x86_64/ca-certificates
# renovate: datasource=repology depName=alpine_3_21/ca-certificates versioning=loose
ENV CA_CERTIFICATES_VERSION="20250911-r0"

# https://pkgs.alpinelinux.org/package/edge/main/x86_64/git
# renovate: datasource=repology depName=alpine_3_21/git versioning=loose
ENV GIT_VERSION="2.47.2-r0"

RUN apk add --no-cache \
 ca-certificates="${CA_CERTIFICATES_VERSION}" \
 git="${GIT_VERSION}"

# https://www.npmjs.com/package/semantic-release
# renovate: datasource=npm depName=semantic-release
ENV SEMANTIC_RELEASE_VERSION="24.2.4"

# https://www.npmjs.com/package/conventional-changelog-conventionalcommits
# renovate: datasource=npm depName=conventional-changelog-conventionalcommits
ENV CONVENTIONAL_CHANGELOG_CONVENTIONALCOMMITS_VERSION="8.0.0"

# https://www.npmjs.com/package/@semantic-release/commit-analyzer
# renovate: datasource=npm depName=@semantic-release/commit-analyzer
ENV SEMANTIC_RELEASE_COMMIT_ANALYZER_VERSION="13.0.1"

# https://www.npmjs.com/package/@semantic-release/release-notes-generator
# renovate: datasource=npm depName=@semantic-release/release-notes-generator
ENV SEMANTIC_RELEASE_RELEASE_NOTES_GENERATOR_VERSION="14.0.3"

# https://www.npmjs.com/package/@semantic-release/changelog
# renovate: datasource=npm depName=@semantic-release/changelog
ENV SEMANTIC_RELEASE_CHANGELOG_VERSION="6.0.3"

# Install semantic-release & dependencies
RUN npm install -g \
      semantic-release@"${SEMANTIC_RELEASE_VERSION}" \
      conventional-changelog-conventionalcommits@"${CONVENTIONAL_CHANGELOG_CONVENTIONALCOMMITS_VERSION}" \
      @semantic-release/commit-analyzer@"${SEMANTIC_RELEASE_COMMIT_ANALYZER_VERSION}" \
      @semantic-release/release-notes-generator@"${SEMANTIC_RELEASE_RELEASE_NOTES_GENERATOR_VERSION}" \
      @semantic-release/changelog@"${SEMANTIC_RELEASE_CHANGELOG_VERSION}" \
 && rm -rf /root/.npm/_cacache

# User is defined in the base image
USER node
