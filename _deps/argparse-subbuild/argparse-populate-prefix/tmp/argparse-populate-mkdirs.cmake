# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "C:/Paradise/server/_deps/argparse-src"
  "C:/Paradise/server/_deps/argparse-build"
  "C:/Paradise/server/_deps/argparse-subbuild/argparse-populate-prefix"
  "C:/Paradise/server/_deps/argparse-subbuild/argparse-populate-prefix/tmp"
  "C:/Paradise/server/_deps/argparse-subbuild/argparse-populate-prefix/src/argparse-populate-stamp"
  "C:/Paradise/server/_deps/argparse-subbuild/argparse-populate-prefix/src"
  "C:/Paradise/server/_deps/argparse-subbuild/argparse-populate-prefix/src/argparse-populate-stamp"
)

set(configSubDirs Debug;Release;MinSizeRel;RelWithDebInfo)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Paradise/server/_deps/argparse-subbuild/argparse-populate-prefix/src/argparse-populate-stamp/${subDir}")
endforeach()
