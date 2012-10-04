#!/bin/bash
export QML_IMPORT_PATH=../qml/:./stubs
export QML_IMPORT_TRACE=1
./test_runner.py $1

