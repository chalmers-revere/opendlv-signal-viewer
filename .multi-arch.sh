#!/bin/sh

VERSION=$1

cat <<EOF >/tmp/multi.yml
image: chalmersrevere/opendlv-signal-view-multi:$VERSION
manifests:
  - image: chalmersrevere/opendlv-signal-view-amd64:$VERSION
    platform:
      architecture: amd64
      os: linux
  - image: chalmersrevere/opendlv-signal-view-armhf:$VERSION
    platform:
      architecture: arm
      os: linux
EOF
manifest-tool-linux-amd64 push from-spec /tmp/multi.yml
