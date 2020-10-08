#!/bin/bash
set -e
safe_source () { [[ ! -z ${1:-} ]] && source $1; _dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; _sdir=$(dirname "$(readlink -f "$0")"); }; safe_source

cd "$_sdir"
make -f ../debugger.mk gen-breakpoints APP= --no-print-directory
# breakpoints.txt must be generated

if diff expected.txt breakpoints.txt &> /dev/null; then
    echo "TEST 1: Passed."
    rm ./breakpoints.txt
else
    [[ "$1" == "--no-diff" ]] || git diff --no-index -- expected.txt breakpoints.txt
    echo "TEST 1: FAILED!"
    exit 1
fi

echo "All tests passed."
