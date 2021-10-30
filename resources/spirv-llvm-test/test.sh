#!/bin/bash

set -e

glslang/build/install/bin/glslangValidator prog.vert -V --aml
llvm-project/llvm/build/bin/llvm-spirv    -r vert.spv
