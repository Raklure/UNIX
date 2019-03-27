#!/bin/bash

#Commande bash à utiliser :
# ./tp4.sh -src images -dest galerie -mask .jpg$ -filldate
#Le -filldate est optionnel, et je met .jpg$ puisqu'il y a conflit avec le *.jpg

source="" #Dossier où sont les images
destination="" #Dossier de destination
mask="" #Extension, ici c'est .jpg$
filldate="0" #Booléen si on rentre les dates en manuel ou non
manualdate="0" #Variable qui va vérifier si on est passé par une certaine étape

#Case pour les arguments
#On lit le premier argument, si on ne le connait pas alors shift
#Si c'est un des arguments, on applique le deuxième argument dans une variable puis on shift 2 fois
while [[ -n $1 ]]; do

	case $1 in
		"-src")
			source=$2
			shift
			;;
		"-dest")
			destination=$2
			shift
			;;
		"-mask")
			mask=$2
			shift
			;;
		"-filldate")
			filldate="1"
			;;
	esac
	shift
done

#On parcourt la liste des fichiers de la source avec un grep de .jpg$ (mask)
for i in $(ls $source |grep $mask); do

	#On stocke la date dans une variable
	date=$(exiftool -d %Y/%m/%d -datetimeoriginal $source/$i)

	#Si on a choisi de rentrer la date manuellement et que la date est vide alors
	if [ "$filldate" -eq "1" ] && [[ -z $date ]]; then
		echo "Enter YYYY/MM/DD : "
		read date
		manualdate="1" #On précise qu'on est passé par cette étape
	fi

	#Si la date n'est pas vide
	if [[ -n $date ]]; then
		#Si on a choisi de rentrer la date manuellement alors
		if [ "$manualdate" -eq "1" ]; then
			#On part du caractère 0 (rien) puis on avance de 4 caractères (Pour les 4 chiffres de l'année)
			year=${date:0:4}
			month=${date:5:2}
			day=${date:8:2}
			#On ajoute la date manuelle à l'image
			exiftool "-datetimeoriginal=$year:$month:$day 00:00:00" $source/$i
		#Si l'image a déjà une date alors
		else
			#On prend uniquement certains caractères de la date pour avoir l'année etc
			year=$(echo $date |cut -c22-25)
			month=$(echo $date |cut -c27-28)
			day=$(echo $date |cut -c30-31)
		fi
		#On créé l'arborescence de dossiers
		mkdir -p $destination/$year/$month/$day
		#On copie les images à leur destination
		cp $source/$i $destination/$year/$month/$day
		echo "$source/$i: OK."
	#Si la date est vide
	else
		echo "$source/$i: pas de date."
	fi
done
