# Copyright Spack Project Developers. See COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)


########################################################################
#
# This file is part of Spack-Packages and sets up the spack packages development
# environment for bash, zsh, and dash (sh).
# Source it like this:
#
#    . /path/to/spack-packages/utils/dev/setup-env.sh
#

# Source to get the latest spack commit being tracked by spack-packages
# This can be overriden when sourcing
. ./.env

SPACK_CLONE_ROOT=$(realpath ${1:-./.spack})
SPACK_CHECKOUT_VERSION=${2:-$SPACK_CHECKOUT_VERSION}
export SPACK_CLONE_ROOT
export SPACK_CHECKOUT_VERSION

echo "SPACK_CLONE_ROOT=${SPACK_CLONE_ROOT}"
echo "SPACK_CHECKOUT_VERSION=${SPACK_CHECKOUT_VERSION}"

function _clone_spack() {
  local spack_clone_root=${1}
  local spack_checkout_version=${2}
  readonly spack_clone_root
  readonly spack_checkout_version

  if [ ! -d "${spack_clone_root}" ]; then
    mkdir -p ${spack_clone_root}
  fi

  cd ${spack_clone_root}
  # Init the spack repo
  if [ ! -d .git/ ]; then
    git init
    git remote add origin https://github.com/spack/spack.git
  fi
  # Fetch the latest version of spack
  git fetch --depth ${SPACK_CLONE_DEPTH:-2} origin ${SPACK_CHECKOUT_VERSION}
  git checkout FETCH_HEAD
  cd -
}

_clone_spack ${SPACK_CLONE_ROOT} ${SPACK_CHECKOUT_VERSION}
# Don't export this function into the sourced shell
unset -f _clone_spack

# This will force re-initialization of spack if
# there was another active spack in the environment
unset _sp_initializing
. ${SPACK_CLONE_ROOT}/share/spack/setup-env.sh
