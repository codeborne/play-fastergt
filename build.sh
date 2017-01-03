#!/bin/bash
MODULE="fastergt"
VERSION=`grep self conf/dependencies.yml | sed "s/.*$MODULE //"`
TARGET=/var/www/repo/play-$MODULE/$MODULE-$VERSION.zip

rm -fr dist
play build-module
zip --delete dist/*.zip "modules/secure"

if [ -e $TARGET ]; then
    echo "Not publishing, $MODULE-$VERSION already exists"
else
    cp dist/*.zip $TARGET
fi
