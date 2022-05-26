# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "C:/Paradise/server/_deps/efsw-src"
  "C:/Paradise/server/_deps/efsw-build"
  "C:/Paradise/server/_deps/efsw-subbuild/efsw-populate-prefix"
  "C:/Paradise/server/_deps/efsw-subbuild/efsw-populate-prefix/tmp"
  "C:/Paradise/server/_deps/efsw-subbuild/efsw-populate-prefix/src/efsw-populate-stamp"
  "C:/Paradise/server/_deps/efsw-subbuild/efsw-populate-prefix/src"
  "C:/Paradise/server/_deps/efsw-subbuild/efsw-populate-prefix/src/efsw-populate-stamp"
)

set(configSubDirs Debug;Release;MinSizeRel;RelWithDebInfo)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Paradise/server/_deps/efsw-subbuild/efsw-populate-prefix/src/efsw-populate-stamp/${subDir}")
endforeach()
