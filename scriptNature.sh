#!/bin/bash
#scriptNature.sh

#Si dossier alors
if [ -d $1 ]; then
	ls $1
#Si fichier alors
elif [ -e $1 ]; then
	cat $1
	echo "Nombre de lignes : "
	wc -l $1
else
	echo "Pas trouvé."
fi
