#!/bin/bash

set -e

git clone git@github.com:llvm/llvm-project.git
pushd llvm-project
  pushd llvm/projects
    git clone git@github.com:KhronosGroup/SPIRV-LLVM-Translator.git
    git clone git@github.com:KhronosGroup/SPIRV-Headers.git
  popd
  pushd llvm
    mkdir build
    pushd build
      cmake -DLLVM_ENABLE_PROJECTS=clang -G "Unix Makefiles" ..
      make -j2
    popd
  popd
popd

git clone git@github.com:KhronosGroup/glslang.git
pushd glslang
  git clone https://github.com/google/googletest.git External/googletest
  pushd External/googletest
    git checkout 0c400f67fcf305869c5fb113dd296eca266c9725
  popd
  ./update_glslang_sources.py
  mkdir build
  pushd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$(pwd)/install" ..
    make -j20 install
  popd
popd

