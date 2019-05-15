#!/usr/bin/env bash

cd ../src/

rm -rf _site/*

bundle exec jekyll build

cd ../deploy/

git clone -b master git@github.com:mde-intelligence/mde-intelligence.github.io.git master

cd master/

rm -rf ./*

cp ../../src/_site/* ./ -R

cp ../../Readme.md ./

git add --all

git commit -m "Workshop Website updated"

git push origin master

cd ..

rm -rf master

echo "Deployment completed"
