#!/bin/bash

tar -xvzf test.tar.gz
O=`pwd`
cd test
git init
git add a b c d e
git config user.name admin
git config user.email admin@nowhere.net
git commit --allow-empty-message -m ""
git remote add origin ssh://admin@localhost:8022/home/admin/admin
echo "Enter the password \"empiredidnothingwrong\" when prompted."
git push --set-upstream origin master
cd $O
curl -k https://localhost:443
rm -rf test/

