#!/bin/bash

clear
while [[ 1 ]]; do
	echo -e " \\n\\n\\n Menu : \\n"
	echo -e "Afficher la date \\t\\t\\t\\t 1"
	echo -e "Afficher le nombre de personnes connectées \\t 2"
	echo -e "Afficher la taille disponible sur le dique \\t 3"
	echo -e "Afficher toutes les images de +1Mo \\t\\t 4"
	echo -e "Convertir tous les jpeg en jpg \\t\\t 5"
	echo -e "Sortie \\t\\t\\t\\t\\t\\t 0"
	echo -n " Choix : "

	read choix;
	echo " "

	case $choix in
	
		1) echo "Nous sommes le " && date;;

		2) who -q;;

		3) df -h | grep "/dev/sda1";;

		4) find / -size +2000 -name "*.jpg" -exec du -h {} \; 2>/dev/null;;

		5) clear
			echo "Conversion ..."
			for f in *.jpeg ; do
				n=$(basename $f);
				mv $f ${n%%.*}".jpg";
			done
			echo "Conversion terminée."
			;;

		0) exit;;

		*) echo "Merci d'entrer un chiffre entre 0 et 5";;

	esac
		
done
