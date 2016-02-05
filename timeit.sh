#!/bin/bash

start=$(date +%s)

./et.sh;

end=$(date +%s)

diff=$((end -start))
echo Time taken to execute commands is $diff seconds
