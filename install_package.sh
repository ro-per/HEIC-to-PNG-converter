#!/bin/bash

if [ "$EUID" -ne 0 ]
then echo "Please run as root"
    exit
else
    apt-get update
    apt-get install libheif-examples
fi
