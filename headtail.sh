#!/bin/bash
# show the first and last 2 lines of a file
# first argument: file name
set -e # terminates error
set -u # terminates if any variable is unset
set -o pipefail # terminates if command within a pipes exits unsuccessfully
(head -n 2; tail -n 2) < "$1"