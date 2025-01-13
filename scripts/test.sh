#!/usr/bin/env bash
set -e
cd "$(dirname "$(dirname "$(readlink -f "$0")")")"

cd examples/nodejs/1_hello_world
for dir in ./*/; do
	cd "$dir"
	npm install
	npm test
done
