#!/bin/bash

for (( i=0 ; i<${#1} ; i=i+1)) ; do
	for (( j=0 ; j<${1:$i:1} ; j=j+1 )) ; do
		echo -n "*";
	done
	echo -e "\n";
done
