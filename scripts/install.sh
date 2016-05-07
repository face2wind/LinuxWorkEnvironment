#!/bin/sh

echo "============= install scripts start ! ============="

cur_path=`pwd -P`
sed -i "s|PATH[^#]*#|PATH=\$PATH:$cur_path #|g" ../homeScripts/.profile

echo "============= install scripts complete ! ============="
echo ""
