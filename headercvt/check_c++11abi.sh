#!/bin/bash

CLANG_BIN_PATH=`which clang++`
CLANG_PATH=`dirname $CLANG_BIN_PATH`

# is Enabled C++11 ABI?
nm $CLANG_PATH/../lib/libclangTooling.a | grep -q __cxx11

IS_ENABLE_CXX11_ABI=$?  # 0 is enabled. 1 is disabled
if [ $IS_ENABLE_CXX11_ABI -eq 0 ]; then
    echo 1
else
    echo 0
fi
