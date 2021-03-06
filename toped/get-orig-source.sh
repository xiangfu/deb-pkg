#!/bin/sh
# Build a tarball from the latest upstream version, with a nice
# version number.

set -e

# Determine version number.
release=0.0
upstream_version="${release}+r${REV}"

TOPFOLDER=toped-$upstream_version.orig

trap 'rm -fr ${TOPFOLDER} || exit 1' EXIT INT TERM

svn export -r${REV} http://toped.googlecode.com/svn/trunk/ ${TOPFOLDER}

# Generate tarball.
echo "packaging ..."
tar -czf toped_$upstream_version.orig.tar.gz ${TOPFOLDER}
