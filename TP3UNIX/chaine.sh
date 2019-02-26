#!/bin/bash

NomFichier=""
NomSortie=""
Recursif=0

while getopts rf:s:h option; do
	case $option in
		r) Recursif=1;;
		f) NomFichier=$OPTARG;;
		s) NomSortie=$OPTARG;;
		h) echo "Options :"
			echo "-r Récursif ou non"
			echo "-f [Fichier d'entrée]"
			echo "-s [Fichier de sortie]"
			echo "-h Displays help"
			exit;;
	esac
done

echo "Récursif		: $Recursif"
echo "Fichier d'entrée	: $NomFichier"
echo -e "Fichier de sortie \\t: $NomSortie"

