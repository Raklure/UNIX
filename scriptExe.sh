#!/bin/bash
# scriptExe.sh

echo "\\n Voulez vous changez le droit d'éxécution pour vous ou pour tout le monde ? (me/all) "
read choix

if [ $choix = "me" ]; then
	chmod u+x $1
elif [ $choix = "all" ]; then
	chmod ugo+x $1
fi
