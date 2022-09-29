#!/bin/env sh

dname=$(echo $1 | sed -e "s/\/$//")
mv $1 `date -Is | sed s/+.*/$dname/`


