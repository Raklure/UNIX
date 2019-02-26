#!/bin/bash

i=0;

#On rempli un tableau de la liste des fichiers / répertoires
for f in * ; do
	elts[$i]=$f;
	i=$i+1;
done

echo "Tableau : ${elts[@]}";


#tri

tri[0]=${elts[0]};

for (( i=0; i<${#elts[@]}; i=i+1 )) ; do
	
done
