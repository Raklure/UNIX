#!/bin/bash
# scriptCarre.sh

for i in `seq $1 $2`;
do

	let "r = $i*$i"
	echo "Carré de $i = $r"

done
