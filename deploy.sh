#!/bin/bash
rm -rf public
hugo
VERSION=$(git rev-parse HEAD)
(
cd public
git init
git remote add origin git@github.com:asmoria/mundarte.ch.git
echo mundarte.ch > CNAME
git add -A
git commit -m "Deploying version $VERSION"
git push -f origin master:gh-pages
)
