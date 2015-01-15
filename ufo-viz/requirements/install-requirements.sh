#!/bin/bash
BASEDIR=$(dirname $0)

sudo xargs -a $BASEDIR/system/base.txt apt-get install -y
sudo xargs -a $BASEDIR/system/dev.txt apt-get install -y

pip install -U -r $BASEDIR/python/base.txt
pip install -U -r $BASEDIR/python/dev.txt
