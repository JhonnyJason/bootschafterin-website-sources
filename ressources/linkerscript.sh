#!/bin/bash

## This script is called to link all ressources for testing
## testing/document-root shall have all ressources available as if it was the real document-root on deployment

pushd testing/document-root

ln -sf ../../sources/ressources/fonts fonts
ln -sf ../../sources/ressources/img img

ln -sf ../../sources/ressources/manifest/* .
ln -sf ../../sources/ressources/favicon/* .

popd

echo 0
