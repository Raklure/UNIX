#!/bin/bash

echo -e "\\nOn déclare la variable locale v1 \\n "
v1=NULL
echo -e "La valeur de v1 est : $v1 \\n"

echo -e "Entrez la nouvelle valeur de v1 : "
read v1
while [[ -z $v1 ]]
do
	echo "La valeur de v1 est vide"
	echo -e "Entrez la nouvelle valeur de v1 : "
	read v1
done
	echo "Nouvelle valeur de v1 : $v1"
