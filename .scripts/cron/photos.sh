#!/usr/bin/env bash
# Hardlinks all Lightroom originals to a flat folder - needs APFS volume to work effectively
if test -e /Volumes/T7/Lightroom; then
    find /Volumes/T7/Lightroom -type f -print0 | xargs -0 -I{} cp -c "{}" /Volumes/T7/Originals
fi
