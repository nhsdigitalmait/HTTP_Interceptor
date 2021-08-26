#!/bin/bash

git remote -v

#prot=https
prot=git

git remote set-url origin $prot@github.com:nhsdigitalmait/HTTP_Interceptor.git

git remote -v
