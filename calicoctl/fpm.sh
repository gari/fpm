#!/usr/bin/env bash

set -e

# curl -O -L https://github.com/projectcalico/calicoctl/releases/download/v3.2.0/calicoctl

NAME="calicoctl"
VERSION="3.8.0"
BINARY_URL="https://github.com/projectcalico/calicoctl/releases/download/v${VERSION}/calicoctl"
ARCHIVE_NAME=$(echo "${BINARY_URL}" | awk -F'/' '{print $NF}')
ITERATION="1"
PREFIX="/usr/local/bin"
VENDOR="https://www.projectcalico.org"
MAINTAINER="Mikhail Petrov"
DESCRIPTION="Secure networking for the cloud native era"
URL="https://www.projectcalico.org"
RHEL="el7"

rm -rf source || true
mkdir source
pushd source
curl -O -L "${BINARY_URL}"
# source/calicoctl
popd

fpm \
    -s dir \
    -t rpm \
    -n "${NAME}" \
    -v "${VERSION}" \
    -m "${MAINTAINER}" \
    --architecture "x86_64" \
    --iteration "${ITERATION}" \
    --vendor "${VENDOR}" \
    --prefix "${PREFIX}" \
    --chdir "source" \
    --url "${URL}" \
    --description "${DESCRIPTION}" \
    --rpm-dist "${RHEL}" \
    --rpm-defattrfile 0755 \
    --rpm-digest md5 \
    --rpm-compression gzip \
    --rpm-os linux \
    --rpm-auto-add-directories \
    calicoctl

rm -rf source
