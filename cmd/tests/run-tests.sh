#!/bin/bash
set -e
safe_source () { [[ ! -z ${1:-} ]] && source $1; _dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; _sdir=$(dirname "$(readlink -f "$0")"); }; safe_source

cd "$_sdir"
make -f ../debugger.mk gen-breakpoints APP= --no-print-directory
# breakpoints.txt must be generated

if diff breakpoints.txt expected.txt; then
    echo "TEST 1: Passed."
    rm ./breakpoints.txt
else
    echo "TEST 1: FAILED!"
    exit 1
fi

echo "All tests passed."
