#!/usr/bin/env bash
# Recursively hardlinks all Lightroom originals to a flat folder - needs APFS volume to work effectively
# $1 = root for Lightroom originals, $2 = target folder
if test -e $1; then
    find $1 -type f -print0 | xargs -0 -I{} cp -c "{}" $2
fi
