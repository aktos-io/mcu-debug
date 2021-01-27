#!/bin/bash
safe_source () { [[ ! -z ${1:-} ]] && source $1; _dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; _sdir=$(dirname "$(readlink -f "$0")"); }; safe_source

cd "$_sdir"
make -f ../debugger.mk gen-breakpoints App="." TEST_EXTENSION=".sample" --no-print-directory > /dev/null
# breakpoints.txt must be generated

if diff expected.txt breakpoints.txt &> /dev/null; then
    rm ./breakpoints.txt
else
    [[ "$1" == "--no-diff" ]] || git diff --no-index -- expected.txt breakpoints.txt
    echo "TEST 1: FAILED!"
    exit 1
fi

echo "All tests passed."
