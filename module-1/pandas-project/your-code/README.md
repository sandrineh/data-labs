![IronHack Logo](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_d5c5793015fec3be28a63c4fa3dd4d55.png)


# Guided Project: Demonstration of Data Cleaning and Manipulation with Pandas

## Overview

The goal of this project is to combine everything you have learned about data wrangling, cleaning, and manipulation with Pandas so you can see how it all works together. For this project, you will start with this messy data set [Shark Attack](https://www.kaggle.com/teajay/global-shark-attacks/version/1). You will need to import it, use your data wrangling skills to clean it up, prepare it to be analyzed, and then export it as a clean CSV data file.

**You will be working individually for this project**, but we'll be guiding you along the process and helping you as you go. Show us what you've got!

---

## Technical Requirements

## Je commencepar importer les librairies dont j'aurais besoin pour la suite du travail
## Importation du fichier

## Lecture des infos

Je commence par lire les infos macro du fichier

## Inspection des colonnes
je fais une premiere inspection "grossière" et peu lisible des colonnes

## les premiers points de cleaning à faire:
1.passer les données en dataframe<br>
2.inspecter les données<br>
3.renommer les colonnes pour une meilleures lecture<br>
4.1 renomer la colonne "Sex " en supprimant l'espace --> OK<br>
5.donner le bon type aux données (int, float, date, string, boolean)<br>
6.on peut fusionner dans la colonne Type les données "boat" et "boating" -->OK<br>
7.dans la colonne Country : mettre tous les pays en Majuscule, corriger le nom "ST. MAARTIN" en "ST. MARTIN",<br> 
   supprimer la ligne "Between PORTUGAL & INDIA" et trouver d'autres info du genre--> OK<br>
8.on peut supprimer les carctères spéciaux (les accents)<br>
9.pour la colonne 'Sex', regarger pourquoi il y a 2 M, pour les 3 autres on les remplace par du non défini. --> OK<br>
10.pour les ages, on peut créér une colonne qui sont des tranches d'age<br>
11.pour 'Fatal', nettoyer les différents 'N' ajouter ce qui n'est pas connus par 'UNKNOWN' et 'F' par 'Y'-->OK<br>
12.supprimer une des colonnes "href" car doublon. Si espace dans l'url ajouter un '-'<br>
13.supprimer les doublons en dernier quand le fichier sera la plus clean à mon goût<br>

## point de vigilance
En voulant travailler sur la colonne "Sex", ça indiquait "undefined" --> il y a un problème de syntaxe. il faut donc renommer la colonne pour supprimer l'espace en trop.<br>
pareil pour la colonne "Species"

## Travail sur la colonne 'Sex'

pour la colonne 'Sex', je corrige pour conserver 3 infos : M, F ou UNKNOWN<br/>
Remarque = possibilité de faire un dico pour y mettre mes modif désirées

## Travail sur la colonne 'Fatal (Y/N)'

Je choisis de ne garder que 3 infos pour la colonne 'Fatal (Y/N)'<br/>
pour cela je nettois les elements plus haut

## Travail sur les colonnes 'Year' et 'Date'
Je commence par regarder coment se présentent les 2 colonnes avec value_counts()

il y a 124 annees avec 0 pour infos et 1 champs avec la valeur 5 et 1 autre avec la valeur 77<br/>

Dans la colonne 'Date', je constate qu'il y a des cellules qui n'ont pas le format date et qui commencent par un "string". 
Je fais 2 travaux en parallèle : <br/>
1) Je cherche les lignes avec les champs 0 dans la colonne 'Year' et pour les renseigner (si nécessaire) en me servant de la colonne Date<br/>
2) je choisis de remplacer ce qui n'est pas en format date par l'info "No date"<br/>
Pour cela, je crée une df temporaire où je split en 3 colonnes les infos de la colonne 'Date' et je renomme les colonnes en 'jour', 'mois','Annee'<br/>
Je concatene ce nouveau tableau avec la colonne 'Year' de la df d'origine<br/>

J'identifie les lignes où Year = 0 et où Jour n'est pas un nombre

Je créé une liste des index pour ensuite remplacer les données qui ne sont pas des dates 

Je choisi d'ajouter une colonne nommée 'Date_clean', pour conserver les dates nettoyées.<br/>
    Si j'ai une date je conserve la date<br/>
    Sinon je mets "No date" pour la liste d'index identifiés plus haut
    
Dans la df temporaire 'result', j'ai aussi vu des info sous le format 1845-1853<br/>
Pour ces formats, je change aussi les cellules de la colonne 'Date_clean' par "No date"

Je regarde maintenant s'il y a d'autres modifications à réaliser

Pour toutes ces modifications, je n'ai pas eu besoin de toucher à la colonne 'Year'<br/>
Je prends maintenant les cas où la colonne 'Year' est renseignée 

Je supprime le mot 'Reported' des cellules pour ne conserver que la date

En faisant un value_counts sur la colonne Date_clean, j'ai repéré quelques points à modifier<br/>
#rl2 mettre no date =[5950,5951,5865,5866,5867,4088,5341,5357,5670,1868]
#mettre 'Year' à 0 et 'Date_clean' à No date=[5865,5866,5867]
#retirer le point et la lettre à la fin = [1133,1134,2990]
#réécrire les dates pour = [5776,5794,3883]

Je décide de mettre 'No date' pour les dates au format 1xxxs

J'applique les dernières modifications

## Travail sur la colonne "Type"
pour la colonne 'Type', je fusionne Boat et Boating

## Travail sur la colonne 'Country'
    #mettre tous les pays en Majuscule,<br/> 
    corriger le nom "ST. MAARTIN" en "ST. MARTIN",<br/>
    #remplacer les NaN par "NC"<br/>
    #passer en "NC" les lignes "Between PORTUGAL & INDIA" ou avec un "?" ou avec "/"<br/>
    #supprimer les espaces avant un mot<br/>
    
## Vérificaton des infos dans les colonnes 'Unnamed: 22' & 'Unnamed: 23'

Comme il n'y a pas d'infos exploitables/nécessaires, je les supprime

## Travail sur la colonne "pdf"
    Je remplace 'pf' par 'pdf'
    
## Travail sur la colonne "href"
Identification des NaN et remplacement des NaN par NC (Non Communiqué) car il est difficile après de faire des 'replace'

## Suppression de la colonne "href formula" 
car identique à la colonne "href"

## Travail sur la colonne "Time"
    remplacer les NaN
    
Je change la syntaxe des élements ayant une heure correcte mais mal écrite pour la suite du nettoyage.<br/>
En effet, avec ce format de date je vais pouvoir remplir la colonne "AM_PM" créée et ensuite les changer en AM, PM ou NC.

Creation d'un nouvelle colonne "AM_PM" pour y reseigner les infos suivantes : le matin-AM de l'apres-midi-PM si pas possible ou vide alors NC

Retour au travail sur la colonne "AM_PM"<br/>
    Je remplace toutes les heures en info AM ou PM suivant le format
    
En checkant les valeurs uniques, on constate qu'il y a une info qui devrait renseigner la colonne "Fatal (Y/N)"<br/>
    Je cherche donc l'index 
    
    je cherche ensuite si la colonne suivante n'a pas l'info
        #pour cela, j'ai réduit le tableau pour vérifier s'il n'y a pas de décalage 
    #mais en fait c'est ok. Donc je ne corrige que la colonne "Fatal" pour cet index
    
# Exportation d'un fichier csv propre