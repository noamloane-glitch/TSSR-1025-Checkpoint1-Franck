#!/bin/bash
#######################
# script pour création compte utilisateur
# script à lancer avec "sudo"
# Paisant Franck
# 21 novembre 2025
########################

#vérification si on a bien les arguments dans le script
if [ "$#" -lt "1" ]
then
    echo " Il manque les noms d'utilisateurs en argument - Fin du script"
    exit 1
fi

for nom_utilisateur in "$@"
do
    #vérificationet création si le compte utilisateur est créé
    if id "$nom_utilisateur" &>/dev/null
    then
        echo " L'utilisateur "$nom_utilisateur" existe déjà !!! "
    else
        useradd "$nom_utilisateur"
            #vérification création compte utilisateur
            if [ $? -eq 0 ]
            then
                echo " L'utilisateur "$nom_utilisateur" a été créé "
            else
                echo " Erreur à la création de l'utilisateur : "$nom_utilisateur" "
            fi
    fi
done
