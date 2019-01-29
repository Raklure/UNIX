#!/bin/bash
# scriptCase.sh

clear
essai=1 ;
while [[ 1 ]] ; do
	echo -e " \\n\\n\\n Menu - Essai : $essai"
	echo " Afficher le répertoire courant		1 "
	echo " Lister les fichiers			2 "
	echo " Informations sur un fichier		3 "
	echo " Changement de répertoire		4 "
	echo " n premières lignes d'un fichier	5 "
	echo " Sortie					0 "
	echo -n " Choix : "

	read choix;
	echo " "

	case $choix in
		1) pwd ;;
		2) ls ;;
		3) 
			echo "Entrez le nom de votre fichier : "
			read nom
			ls -l $nom
			;;
		4) 
			echo "Indiquez le nom du répertoire auquel vous voulez accéder : "
			read direc
			cd $direc
			;;
		5)
			echo "Nom du fichier : "
			read nom
			echo "Nombre de lignes : "
			read nblignes
			clear
			head -n $nblignes $nom
			;;
		0) exit ;;
		*) echo "Merci de saisir un entie entre 0 et 5" ;;
	esac
	essai=$(( essai + 1 )) ;
done
