#!/bin/bash

set -e

THIS=$(basename $0)
DIR="$( cd -P "$( dirname "$0" )" && pwd )"
cd $DIR
cd ..

CURR_FOLDER=`pwd`
GH_TOKEN=`cat .ghtoken`
GH_REF=`cat .ghref`

rm -rf /tmp/csstest || exit 0;
mkdir -p /tmp/csstest
jade *.jade
mv *.html /tmp/csstest
cd /tmp/csstest
git init
git add .
git commit -m "Deploy to GitHub Pages"
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1
exit 0
