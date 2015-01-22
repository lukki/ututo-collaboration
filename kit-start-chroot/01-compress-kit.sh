#!/bin/bash
cd kit
date > kit.lastversion
cp -a kit.lastversion ../kit.lastversion
tar cf - * | bzip2 -f > ../kit.tar.bz2
