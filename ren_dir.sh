#!/bin/env sh

#!/bin/sh
if [ $# != 1 ]; then
    echo 引数エラー: $*
    echo 引数は1つだけ
    exit 1
fi

dname=$(echo $1 | sed -e "s/\/$//")
mv $1 `date -Is | sed s/+.*/$dname/`


